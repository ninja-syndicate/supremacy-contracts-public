// SPDX-License-Identifier: AGPL-1.0-only
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact privacy-admin@supremacy.game
contract SUPS is ERC20, Ownable {
	bool public transferrable;

	constructor(uint256 initialSupply) ERC20("Supremacy", "SUPS") {
		_mint(msg.sender, initialSupply);
	}

	// setTransferable when platform is ready to allow users to transfer
	function setTransferable(bool _transferrable) public onlyOwner {
		transferrable = _transferrable;
		emit SetTransferrable(_transferrable);
	}

	// _beforeTokenTransfer allows owner to transfer if the flag isn't set yet
	function _beforeTokenTransfer(
		address from,
		address to,
		uint256 amount
	) internal virtual override {
		super._beforeTokenTransfer(from, to, amount);
		if (msg.sender != owner()) {
			require(transferrable, "transfers are locked");
		}
	}

	event SetTransferrable(bool _transferrable);
}
