// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeHelper.sol";

contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools;
    mapping(uint256 => Company) public Companies;

    uint256 TotalPools;

    struct RegistrationPool {
        address Owner;
        string[] Keys;
        uint256[] CompaniesId;
        bool IsActive;
        FeeBaseHelper FeeProvider;
        uint256 TotalCompanies;
    }

    struct Company {
        uint256 PoolId;
        uint256 CompanyId;
        string[] Values;
    }
}
