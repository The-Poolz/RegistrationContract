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

        Companies[TotalCompanies] = Company(
            msg.sender,
            _poolId,
            TotalCompanies,
            _values,
            _values.length
        );
        pool.CompaniesId.push(TotalCompanies);
        pool.TotalCompanies++;

        emit NewRegistration(TotalCompanies, _values);
        TotalCompanies++;
    }

    function EditValues(uint256 _companyId, string[] memory _values)
        external
        whenNotPaused
        isCorrectCompanyId(_companyId)
        mustHaveElements(_values)
        onlyCompanyOwner(_companyId)
    {
        require(
            Companies[_companyId].Values.length == _values.length,
            "New values array must be the same length as previous."
        );

        string[] storage oldValues = Companies[_companyId].Values;
        Companies[_companyId].Values = _values;

        emit CompanyValuesChanged(oldValues, _values);
    }

    function GetAllMyCompanyIds() external view returns (uint256[] memory) {
        uint256 counter = 0;
        for (uint256 i = 0; i < TotalCompanies; i++) {
            if (Companies[i].Owner == msg.sender) {
                counter++;
            }
        }

        uint256[] memory companyIds = new uint256[](counter);
        uint256 j = 0;
        for (uint256 i = 0; i < TotalCompanies; i++) {
            if (Companies[i].Owner == msg.sender) {
                companyIds[j++] = i;
            }
        }

        return companyIds;
    }
}
