// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, FeeBaseHelper {
    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId >= 0 && _poolId < TotalPools, "Incorrect pool id.");
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
