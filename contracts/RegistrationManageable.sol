// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPublic.sol";

/// @title contains admin's actions
contract RegistrationManageable is RegistrationPublic, FeeBaseHelper {
    function Pause() external onlyOwnerOrGov {
        _pause();
    }

    function Unpause() external onlyOwnerOrGov {
        _unpause();
    }
}
