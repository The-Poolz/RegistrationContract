// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationEvents.sol";

/// @title contains all modifiers and stores variables.
contract MultiSigModifiers is RegistrationEvents {
    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId < TotalPools, "Incorrect pool id.");
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {
        require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
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
