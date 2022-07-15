// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
    function SignUp(uint256 _poolId, string[] memory _values)
        external
        payable
        whenNotPaused
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
        validateStatus(_poolId, true)
        sameLenghtArrays(RegistrationPools[_poolId].Keys, _values)
    {
        RegistrationPools[_poolId].FeeProvider.PayFee{value: msg.value}(
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
            RegistrationPools[_poolId].SignUpPools[_signUpId].Values,
            _values
        )
    {
        emit SignUpValuesChanged(
            _poolId,
            _signUpId,
            _values,
            RegistrationPools[_poolId].SignUpPools[_signUpId].Values
        );
        _settingValues(_poolId, _signUpId, _values);
    }

    function _settingValues(
        uint256 _poolId,
        uint256 _signUpId,
        string[] memory _values
    ) internal {
        RegistrationPools[_poolId].SignUpPools[_signUpId] = SignUpPool(
            msg.sender,
            _values
        );
    }

    function GetAllMySignUpIds(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (uint256[] memory)
    {
        uint256 counter = 0;
        for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
            if (RegistrationPools[_poolId].SignUpPools[i].Owner == msg.sender) {
                counter++;
            }
        }

        uint256[] memory signUpIds = new uint256[](counter);
        uint256 j = 0;
        for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
            if (RegistrationPools[_poolId].SignUpPools[i].Owner == msg.sender) {
                signUpIds[j++] = i;
            }
        }

        return signUpIds;
    }
}
