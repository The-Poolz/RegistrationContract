// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

/// @title Contains all of the data
/// @author The-Poolz contracts team
/// @notice You can use this contract for an access to all of the data
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools; /// stores all the data of the created pools
    mapping(address => uint256[]) public MyPools; /// can use for getting all of your pool ids
    uint256 public TotalPools; /// total amount of the created pools

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
