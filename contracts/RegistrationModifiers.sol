// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationEvents.sol";

/// @title contains all modifiers
contract RegistrationModifiers is RegistrationEvents {
    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId < TotalPools, "Incorrect pool id.");
        _;
    }

    modifier isCorrectCompanyId(uint256 _companyId) {
        require(_companyId < TotalSignUps, "Incorrect SignUPool id.");
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {
        require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
        );
        _;
    }

    modifier onlySignUpOwner(uint256 _companyId) {
        require(
            SignUpPools[_companyId].Owner == msg.sender,
            "You are not an owner of SignUpPool."
        );
        _;
    }

    modifier mustHaveElements(string[] memory data) {
        require(data.length > 0, "Data array must have elements.");
        _;
    }

    modifier validateStatus(uint256 _poolId, bool _status) {
        require(
            RegistrationPools[_poolId].IsActive == _status,
            "Pool already has the same status."
        );
        _;
    }
}
