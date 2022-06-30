// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x7658c179(bytes32 c__0x7658c179) pure {}


import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
function c_0xa84bbffe(bytes32 c__0xa84bbffe) internal pure {}

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
