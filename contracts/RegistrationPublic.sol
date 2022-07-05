// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "./RegistrationModifiers.sol";

/// @title allows to get pool's keys or SignUp's values
contract RegistrationPublic is RegistrationModifiers, Pausable {
    function GetKeys(uint256 _poolId)
        external
        view
        whenNotPaused
        isCorrectPoolId(_poolId)
        returns (string[] memory)
    {
        return RegistrationPools[_poolId].Keys;
    }

    function GetValues(uint256 _signUpId)
        external
        view
        whenNotPaused
        isCorrectSignUpId(_signUpId)
        returns (string[] memory)
    {
        return SignUpPools[_signUpId].Values;
    }
}
