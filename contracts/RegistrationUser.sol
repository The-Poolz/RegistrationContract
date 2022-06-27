// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
    event NewRegistration(
        Company RegisteredCompany,
        string[] Values,
        uint256 ValuesAmount,
        uint256 Price
    );

    function Register(uint256 _poolId, string[] memory _values)
        external
        payable
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
    {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        require(
            pool.Keys.length == _values.length,
            "Values must be the same length as the keys."
        );
        pool.FeeProvider.PayFee{value: msg.value}(pool.FeeProvider.Fee());

        uint256 totalCompanies = ++RegistrationPools[_poolId].TotalCompanies;
        Companies[totalCompanies] = Company(_poolId, totalCompanies, _values);
        pool.CompaniesId.push(totalCompanies);

        emit NewRegistration(
            Companies[totalCompanies],
            _values,
            _values.length,
            pool.FeeProvider.Fee()
        );
    }
}
