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

        uint256 totalCompanies = RegistrationPools[_poolId].TotalCompanies;
        Companies[totalCompanies] = Company(_poolId, totalCompanies, _values);
        pool.CompaniesId.push(totalCompanies);

        emit NewRegistration(
            RegistrationPools[_poolId].TotalCompanies,
            _values
        );
        RegistrationPools[_poolId].TotalCompanies++;
    }
}
