// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools;
    mapping(uint256 => SignUpPool) public SignUpPools;

    uint256 public TotalPools;
    uint256 public TotalSignUps;

    struct RegistrationPool {
        address Owner;
        string[] Keys;
        uint256[] SignUpsId;
        bool IsActive;
        FeeBaseHelper FeeProvider;
        uint256 TotalSignUps;
        uint256 TotalKeys;
    }

    struct SignUpPool {
        address Owner;
        uint256 PoolId;
        uint256 SignUpId;
        string[] Values;
        uint256 TotalValues;
    }
}
