// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools;
    uint256 public TotalPools;

    struct RegistrationPool {
        address Owner;
        string[] Keys;
        bool IsActive;
        FeeBaseHelper FeeProvider;
        uint256 UserSignUps;
        uint256 TotalKeys;
        mapping(uint256 => SignUpPool) SignUpPools;
    }

    struct SignUpPool {
        address Owner;
        string[] Values;
    }
}
