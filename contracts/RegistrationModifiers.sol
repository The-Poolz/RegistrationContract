// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationEvents.sol";

/// @title contains all modifiers
contract RegistrationModifiers is RegistrationEvents {
    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId < TotalPools, "Incorrect pool id.");
        _;
    }

    modifier isCorrectSignUpId(uint256 _poolId, uint256 _signUpId) {
        require(
            _signUpId < RegistrationPools[_poolId].UserSignUps,
            "Incorrect SignUp id."
        );
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {
        require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
        );
        _;
    }

    modifier onlySignUpOwner(uint256 _poolId, uint256 _signUpId) {
        require(
            RegistrationPools[_poolId].SignUpPools[_signUpId].Owner ==
                msg.sender,
            "You are not an owner of SignUp."
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

    modifier sameLenghtArrays(string[] memory arr1, string[] memory arr2) {
        require(
            arr1.length == arr2.length,
            "Both arrays must have the same length."
        );
        _;
    }
}
