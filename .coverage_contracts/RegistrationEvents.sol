// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0xecee1707(bytes32 c__0xecee1707) pure {}


import "./RegistrationData.sol";

/// @title contains all events.
contract RegistrationEvents is RegistrationData {
function c_0x53127bc4(bytes32 c__0x53127bc4) internal pure {}

    event NewRegistrationPoolCreated(
        uint256 PoolId,
        string[] Keys,
        address Owner,
        address TokenFee,
        uint256 Fee
    );
    event NewRegistration(uint256 CompanyId, string[] Values);
    event RegistrationPoolActivated(uint256 PoolId);
    event RegistrationPoolDeactivated(uint256 PoolId);
}
