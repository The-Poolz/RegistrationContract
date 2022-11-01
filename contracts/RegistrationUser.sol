// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

/// @title Contains the functions, that can call a user
/// @author The-Poolz contracts team
/// @notice You can use this contract as a user to do sign ups and other related to that actions
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationUser is RegistrationPO {
    /// @notice It allows a user to sign up in the concrete pool with the values
    /// @param _poolId An id of a pool
    /// @param _values The string values that were filled by user
    function SignUp(uint256 _poolId, string[] memory _values)
        external
        payable
        whenNotPaused
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
        validateStatus(_poolId, true)
        sameLenghtArrays(RegistrationPools[_poolId].Keys, _values)
    {
        FeeBaseHelper FeeProvider = RegistrationPools[_poolId].FeeProvider;
        if (FeeProvider.FeeToken() != address(0) && FeeProvider.Fee() > 0) {
            TransferInToken(FeeProvider.FeeToken(), msg.sender, FeeProvider.Fee());
            IERC20(FeeProvider.FeeToken()).approve(address(FeeProvider), FeeProvider.Fee());
        }
        FeeProvider.PayFee{value: msg.value}(
            RegistrationPools[_poolId].FeeProvider.Fee()
        );

        _settingValues(
            _poolId,
            RegistrationPools[_poolId].UserSignUps,
            _values
        );

        emit NewRegistration(
            _poolId,
            RegistrationPools[_poolId].UserSignUps++,
            _values
        );
    }

    /// @notice It allows a signUp owner to change the values of the concrete signUp in the pool
    /// @param _poolId An id of a pool
    /// @param _signUpId An id of a signUp
    /// @param _values The new string values that were filled by user
    function EditValues(
        uint256 _poolId,
        uint256 _signUpId,
        string[] memory _values
    )
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        isCorrectSignUpId(_poolId, _signUpId)
        mustHaveElements(_values)
        onlySignUpOwner(_poolId, _signUpId)
        sameLenghtArrays(
            RegistrationPools[_poolId].SignUps[_signUpId].Values,
            _values
        )
    {
        string[] storage oldValues = RegistrationPools[_poolId]
            .SignUps[_signUpId]
            .Values;

        emit SignUpValuesChanged(_poolId, _signUpId, _values, oldValues);

        _settingValues(_poolId, _signUpId, _values);
    }

    /// @dev This is an internal function that creates a new SignUpForm and set it to the pool
    /// @param _poolId An id of a pool
    /// @param _signUpId An id of a sign up
    /// @param _values The string values that were filled by user
    function _settingValues(
        uint256 _poolId,
        uint256 _signUpId,
        string[] memory _values
    ) internal {
        RegistrationPools[_poolId].SignUps[_signUpId] = SignUpForm(
            msg.sender,
            _values
        );
    }

    /// @notice You can get all of your signUp ids by calling this function
    /// @param _poolId An id of a pool
    /// @return ids The ids of your signUps
    function GetAllMySignUpIds(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (uint256[] memory)
    {
        uint256 counter = 0;
        for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
            if (RegistrationPools[_poolId].SignUps[i].Owner == msg.sender) {
                counter++;
            }
        }

        uint256[] memory signUpIds = new uint256[](counter);
        counter = 0;
        for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
            if (RegistrationPools[_poolId].SignUps[i].Owner == msg.sender) {
                signUpIds[counter++] = i;
            }
        }

        return signUpIds;
    }
}
