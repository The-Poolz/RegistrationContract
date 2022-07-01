// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/Pausable.sol";
import "./RegistrationModifiers.sol";

/// @title contains all modifiers and stores variables.
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

    function GetValues(uint256 _companyId)
        external
        view
        whenNotPaused
        isCorrectCompanyId(_companyId)
        returns (string[] memory)
    {
        return Companies[_companyId].Values;
    }
}
