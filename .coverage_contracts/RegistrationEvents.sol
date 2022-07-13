// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x5870135c(bytes32 c__0x5870135c) pure {}


import "./RegistrationData.sol";

/// @title contains all events.
contract RegistrationEvents is RegistrationData {
function c_0xde727c90(bytes32 c__0xde727c90) internal pure {}

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
    event SignUpValuesChanged(string[] NewValues, string[] OldValues);
}
