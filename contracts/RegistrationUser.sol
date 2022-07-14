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
        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.PayFee{value: msg.value}(pool.FeeProvider.Fee());

        pool.SignUpPools[pool.UserSignUps] = SignUpPool(
            msg.sender,
            _poolId,
            pool.UserSignUps,
            _values
        );

        emit NewRegistration(_poolId, pool.UserSignUps, _values);
        pool.UserSignUps++;
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
        string[] memory oldValues = RegistrationPools[_poolId]
            .SignUpPools[_signUpId]
            .Values;
        RegistrationPools[_poolId].SignUpPools[_signUpId].Values = _values;

        emit SignUpValuesChanged(_values, oldValues);
    }

    function GetAllMySignUpIds(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (uint256[] memory)
    {
        address[] memory owners = new address[](
            RegistrationPools[_poolId].UserSignUps
        );
        for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
            owners[i] = RegistrationPools[_poolId].SignUpPools[i].Owner;
        }

        return
            _findMatchingValues(
                RegistrationPools[_poolId].UserSignUps,
                _getOwners(RegistrationPools[_poolId].UserSignUps)
            );
    }
}
