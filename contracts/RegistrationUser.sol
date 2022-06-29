// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
    modifier validateSender() {
        require(
            msg.sender == tx.origin && !_isContract(msg.sender),
            "Some thing wrong with the msgSender"
        );
        _;
    }

    function Register(uint256 _poolId, string[] memory _values)
        external
        payable
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
        validateStatus(_poolId, true)
        validateSender
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
            Companies[totalCompanies],
            _values,
            _values.length,
            pool.CompaniesId[pool.CompaniesId.length - 1],
            pool.FeeProvider.Fee()
        );
        RegistrationPools[_poolId].TotalCompanies++;
    }

    function _isContract(address _addr) internal view returns (bool) {
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}
