// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "./RegistrationModifiers.sol";

/// @title allows to get pool's keys or SignUp's values
contract RegistrationPublic is RegistrationModifiers, Pausable {
    function GetKeys(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (string[] memory)
    {
        return RegistrationPools[_poolId].Keys;
    }

    function GetValues(uint256 _poolId, uint256 _signUpId)
        external
        view
        isCorrectPoolId(_poolId)
        isCorrectSignUpId(_poolId, _signUpId)
        returns (string[] memory)
    {
        return RegistrationPools[_poolId].SignUpPools[_signUpId].Values;
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
