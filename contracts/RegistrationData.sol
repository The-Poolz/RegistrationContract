// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeHelper.sol";

contract RegistrationData {
    mapping(uint256 => string) public Keys;
    mapping(uint256 => string) public Values;
    mapping(uint256 => RegistrationPool) public RegistrationPools;

    uint256 TotalPools;
    uint256 TotalKeys;

    struct Parameter {
        string Key;
        string Value;
    }

    struct RegistrationPool {
        address Owner;
        bool IsActive; 
        FeeBaseHelper FeeProvider;
        mapping(uint256 => Company) Companies;
        uint256 TotalCompanies;
    }

    struct Company {
        uint256 PoolId;
        uint256 CompanyId;
        Parameter[] Parameters;
    }
}