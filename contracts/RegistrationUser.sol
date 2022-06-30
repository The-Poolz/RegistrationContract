// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
    function Register(uint256 _poolId, string[] memory _values)
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

        Companies[TotalCompanies] = Company(_poolId, TotalCompanies, _values, _values.length);
        pool.CompaniesId.push(TotalCompanies);
        pool.TotalCompanies++;

        emit NewRegistration(TotalCompanies, _values);
        TotalCompanies++;
    }
}
