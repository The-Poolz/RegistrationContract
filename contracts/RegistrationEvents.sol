// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationData.sol";

/// @title Contains all the events.
/// @author The-Poolz contracts team
/// @notice You can use this contract to have an understanding of the events
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationEvents is RegistrationData {
    event NewRegistrationPoolCreated(
        uint256 PoolId,
        string[] Keys,
        address Owner,
        address TokenFee,
        uint256 Fee
    );
    event NewRegistration(uint256 PoolId, uint256 SignUpId, string[] Values);
    event RegistrationPoolActivated(uint256 PoolId);
    event RegistrationPoolDeactivated(uint256 PoolId);
    event SignUpValuesChanged(
        uint256 PoolId,
        uint256 SignUpId,
        string[] NewValues,
        string[] OldValues
    );
}
