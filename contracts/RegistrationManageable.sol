// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPublic.sol";

import "@openzeppelin/contracts/security/Pausable.sol";

/// @title contains all modifiers and stores variables.
contract RegistrationManageable is RegistrationPublic, FeeBaseHelper, Pausable {
    function Pause() external onlyOwnerOrGov {
        _pause();
    }

    function Unpause() external onlyOwnerOrGov {
        _unpause();
    }
}
