// SPDX-License-Identifier: AGPL-1.0-only
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact privacy-admin@supremacy.game
contract ERC20Mock is ERC20, Ownable {
	constructor(uint256 initialSupply, string memory name)
		ERC20("ERC20 Token", name)
	{
		_mint(msg.sender, initialSupply);
	}
}
