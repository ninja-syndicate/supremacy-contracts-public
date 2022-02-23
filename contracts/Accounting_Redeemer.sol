// SPDX-License-Identifier: AGPL-1.0-only
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

uint256 constant MAX_UINT256 = 2**256 - 1;

/// @custom:security-contact privacy-admin@supremacy.game
contract Redeemer is Ownable {
	using SafeERC20 for IERC20;

	IERC20 private immutable busd;
	IERC20 private immutable sups;

	uint256 public BUSDFundingRatePerBlock;
	uint256 public lastRedemptionBlockHeight;
	uint256 public maximumRedeemableSUPSAmount;
	uint256 public minimumRedeemableSUPSAmount;
	uint256 public SUPSPerBUSD;
	bool public canRedeem;

	constructor(
		address _busdAddr,
		address _supsAddr,
		uint256 _SUPSPerBUSD,
		uint256 _BUSDFundingRatePerBlock,
		uint256 _maximumRedeemableSUPSAmount,
		uint256 _minimumRedeemableSUPSAmount
	) {
		require(_SUPSPerBUSD > 0);
		require(_maximumRedeemableSUPSAmount > 0);
		require(_minimumRedeemableSUPSAmount > 0);
		require(_busdAddr != address(0));
		require(_supsAddr != address(0));

		busd = IERC20(_busdAddr);
		sups = IERC20(_supsAddr);

		SUPSPerBUSD = _SUPSPerBUSD;
		BUSDFundingRatePerBlock = _BUSDFundingRatePerBlock;
		maximumRedeemableSUPSAmount = _maximumRedeemableSUPSAmount;
		minimumRedeemableSUPSAmount = _minimumRedeemableSUPSAmount;
		lastRedemptionBlockHeight = block.number;
	}

	function setMaximumRedeemableSUPSAmount(
		uint256 _maximumRedeemableSUPSAmount
	) public onlyOwner {
		maximumRedeemableSUPSAmount = _maximumRedeemableSUPSAmount;
		emit SetMinimumRedeemableSUPSAmount(_maximumRedeemableSUPSAmount);
	}

	function setMinimumRedeemableSUPSAmount(
		uint256 _minimumRedeemableSUPSAmount
	) public onlyOwner {
		maximumRedeemableSUPSAmount = _minimumRedeemableSUPSAmount;
		emit SetMaximumRedeemableSUPSAmount(_minimumRedeemableSUPSAmount);
	}

	function setExchangeRate(uint256 _SUPSPerBUSD) public onlyOwner {
		SUPSPerBUSD = _SUPSPerBUSD;
		emit SetExchangeRate(_SUPSPerBUSD);
	}

	// setCanRedeem updates the speed the faucet increases
	function setCanRedeem(bool _canRedeem) public onlyOwner {
		canRedeem = _canRedeem;
		emit SetCanRedeem(_canRedeem);
	}

	// setFundingRate updates the speed the faucet increases
	function setFundingRate(uint256 _BUSDFundingRatePerBlock) public onlyOwner {
		BUSDFundingRatePerBlock = _BUSDFundingRatePerBlock;
		emit SetFundingRate(_BUSDFundingRatePerBlock);
	}

	// flushBUSD returns the BUSD to the owner
	function flushBUSD() public onlyOwner {
		uint256 amt = busd.balanceOf(address(this));
		busd.safeTransfer(msg.sender, amt);
	}

	// flushSUPS returns the SUPS to the owner
	function flushSUPS() public onlyOwner {
		uint256 amt = sups.balanceOf(address(this));
		sups.safeTransfer(msg.sender, amt);
	}

	// availableBUSD returns the available BUSD in the faucet
	function availableBUSD() public view returns (uint256) {
		return _availableBUSD();
	}

	// _availableBUSD returns the available BUSD in the faucet
	function _availableBUSD() internal view returns (uint256) {
		uint256 diff = block.number - lastRedemptionBlockHeight;
		uint256 amt = busd.balanceOf(address(this));
		uint256 available = diff * BUSDFundingRatePerBlock;
		if (available > amt) {
			available = amt;
		}
		return available;
	}

	// redeem swaps SUPS for BUSD
	function redeem(uint256 supAmt) public {
		require(canRedeem, "Redemption not enabled");
		require(
			supAmt <= maximumRedeemableSUPSAmount,
			"Too many SUPS redeemed"
		);
		require(supAmt >= minimumRedeemableSUPSAmount, "Too few SUPS redeemed");
		uint256 available = _availableBUSD();
		uint256 busdAmt = supAmt / SUPSPerBUSD;
		require(busdAmt > 0, "Need more SUPS");
		require(busdAmt <= available, "Not enough BUSD available");
		sups.safeTransferFrom(msg.sender, address(this), supAmt);
		busd.safeTransfer(msg.sender, busdAmt);
		lastRedemptionBlockHeight = block.number;
	}

	event SetFundingRate(uint256 _BUSDFundingRatePerBlock);
	event SetCanRedeem(bool _canRedeem);
	event SetMaximumRedeemableSUPSAmount(uint256 _maximumRedeemableSUPSAmount);
	event SetMinimumRedeemableSUPSAmount(uint256 _minimumRedeemableSUPSAmount);
	event SetExchangeRate(uint256 _SUPSPerBUSD);
}
