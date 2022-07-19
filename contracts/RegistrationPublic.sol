// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "./RegistrationModifiers.sol";

/// @title Contains the functions, that everybody can use
/// @author The-Poolz contracts team
/// @notice You can use this contract to call any function for a public usage
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationPublic is RegistrationModifiers, Pausable {
    /// @notice You can get all of your signUp ids by calling this function
    /// @param _poolId An id of a pool
    /// @return keys An array of the string keys of the concrete pool
    function GetKeys(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (string[] memory)
    {
        return RegistrationPools[_poolId].Keys;
    }

    /// @notice You can get all of your signUp ids by calling this function
    /// @param _poolId An id of a pool
    /// @param _signUpId An id of a signUp
    /// @return keys An array of the string keys of the concrete signUp in the pool
    function GetValues(uint256 _poolId, uint256 _signUpId)
        external
        view
        isCorrectPoolId(_poolId)
        isCorrectSignUpId(_poolId, _signUpId)
        returns (string[] memory)
    {
        return RegistrationPools[_poolId].SignUps[_signUpId].Values;
    }

    /// @notice You can get a signing up fee of the pool
    /// @param _poolId An id of the pool
    /// @return feeToken A fee token for a signing up in the pool
    /// @return fee A fee amount for a signing up in the pool
    function GetPoolSignUpFee(uint256 _poolId)
        external
        view
        returns (address feeToken, uint256 fee)
    {
        return (
            RegistrationPools[_poolId].FeeProvider.FeeToken(),
            RegistrationPools[_poolId].FeeProvider.Fee()
        );
    }
}
