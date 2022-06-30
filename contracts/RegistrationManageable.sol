// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationModifiers.sol";

import "@openzeppelin/contracts/security/Pausable.sol";

/// @title contains all modifiers and stores variables.
contract RegistrationManageable is
    RegistrationModifiers,
    FeeBaseHelper,
    Pausable
{
    function Pause() external onlyOwnerOrGov {
        _pause();
    }

    function Unpause() external onlyOwnerOrGov {
        _unpause();
    }
}
