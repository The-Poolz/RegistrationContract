// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools;
    mapping(uint256 => Company) public Companies;

    uint256 public TotalPools;
    uint256 public TotalCompanies;

    struct RegistrationPool {
        address Owner;
        string[] Keys;
        uint256[] CompaniesId;
        bool IsActive;
        FeeBaseHelper FeeProvider;
        uint256 TotalCompanies;
        uint256 TotalKeys;
    }

    struct Company {
        uint256 PoolId;
        uint256 CompanyId;
        string[] Values;
        uint256 TotalValues;
    }
}
