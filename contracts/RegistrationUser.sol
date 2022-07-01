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
    {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        require(
            pool.Keys.length == _values.length,
            "Values must be the same length as the keys."
        );
        pool.FeeProvider.PayFee{value: msg.value}(pool.FeeProvider.Fee());

        SignUpPools[TotalSignUps] = SignUpPool(
            msg.sender,
            _poolId,
            TotalSignUps,
            _values,
            _values.length
        );
        pool.SignUpsId.push(TotalSignUps);
        pool.TotalSignUps++;

        emit NewRegistration(TotalSignUps, _values);
        TotalSignUps++;
    }

    function EditValues(uint256 _companyId, string[] memory _values)
        external
        whenNotPaused
        isCorrectCompanyId(_companyId)
        mustHaveElements(_values)
        onlySignUpOwner(_companyId)
    {
        require(
            SignUpPools[_companyId].Values.length == _values.length,
            "New values array must be the same length as previous."
        );

        string[] storage oldValues = SignUpPools[_companyId].Values;
        SignUpPools[_companyId].Values = _values;

        emit SignUpValuesChanged(oldValues, _values);
    }

    function GetAllMySignUpIds() external view returns (uint256[] memory) {
        uint256 counter = 0;
        for (uint256 i = 0; i < TotalSignUps; i++) {
            if (SignUpPools[i].Owner == msg.sender) {
                counter++;
            }
        }

        uint256[] memory signUpIds = new uint256[](counter);
        uint256 j = 0;
        for (uint256 i = 0; i < TotalSignUps; i++) {
            if (SignUpPools[i].Owner == msg.sender) {
                signUpIds[j++] = i;
            }
        }

        return signUpIds;
    }
}
