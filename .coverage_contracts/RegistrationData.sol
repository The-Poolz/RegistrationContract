// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x0cc80a10(bytes32 c__0x0cc80a10) pure {}


import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
function c_0xc58a8a46(bytes32 c__0xc58a8a46) internal pure {}

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
        uint256 PoolId;
        uint256 SignUpId;
        string[] Values;
    }
}
