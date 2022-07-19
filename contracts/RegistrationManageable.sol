// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPublic.sol";

/// @title Contains all the admin actions
/// @author The-Poolz contracts team
/// @notice You can use this contract only if you are an admin
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationManageable is RegistrationPublic, FeeBaseHelper {
    function Pause() external onlyOwnerOrGov {
        _pause();
    }

    function Unpause() external onlyOwnerOrGov {
        _unpause();
    }
}
