// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact diegonarantes@gmail.com
contract DirectMission is ERC20, ERC20Pausable, Ownable {
   constructor(address recipient, address initialOwner)
        ERC20("Direct Mission", "DMSN")
        Ownable(initialOwner) // Define o dono inicial
{
    _mint(recipient, 1000000000000000000000000000 * 10 ** decimals()); // Envia os tokens para o recipiente
}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, value);
    }
}
