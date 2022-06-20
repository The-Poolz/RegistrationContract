// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/ETHHelper.sol";
import "poolz-helper-v2/contracts/GovManager.sol";
import "poolz-helper-v2/contracts/FeeHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, GovManager, ETHHelper, ERC20Helper {
    event NewRegistration(
        Parameter[] Parameters,
        uint256 ParamsLength,
        uint256 Price,
        Company RegisteredCompany
    );

    event NewRegistrationPoolCreated(
        uint256 PoolId,
        address Owner,
        address TokenFee,
        uint256 Fee
    );

    event RegistrationPriceChanged(
        uint256 PoolId,
        address Token,
        uint256 NewPrice
    );

    modifier isCorrectPoolId(uint _poolId) {
        require(_poolId > 0, "Incorrect pool id.");
        _;
    }

    function PayComission(uint256 _poolId) internal isCorrectPoolId(_poolId) {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.PayFee(pool.FeeProvider.Fee());
    }

    function CreateNewRegistrationPool(
        address _token,
        uint256 _fee
    ) external {

        RegistrationPools[++TotalPools] = RegistrationPool(
            msg.sender,
            true,
            new FeeBaseHelper()
        );

        RegistrationPool storage newPool = RegistrationPools[TotalPools];

        SetPrice(TotalPools, _fee, _token);

        emit NewRegistrationPoolCreated(
            TotalPools,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
    }
    
    function Register(
        uint256 _poolId, 
        string[] memory _parameters, 
        string[] memory _values
        ) 
        public payable 
        isCorrectPoolId(_poolId)
    {
        require(_parameters.length > 0 && _values.length > 0, 
                "Parameters and values arrays must have elements.");
        require(_parameters.length == _values.length, "Parameters and values arrays length must be equal.");

        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.PayFee(pool.FeeProvider.Fee());

        Parameter[] storage parameters;

        for (uint256 i = 0; i < _parameters.length; i++) {
            parameters[i] = Parameter(_parameters[i], _values[i]);
        }

        require(parameters.length == _parameters.length, 
                "New parameter and previos parameter arrays length must be equal.");
        uint256 companiesAmount = RegistrationPools[_poolId].TotalCompanies;
        RegistrationPools[_poolId].Companies[++companiesAmount] = Company(
            _poolId,
            parameters,
            companiesAmount
        );
        RegistrationPools[_poolId].TotalCompanies++;

        emit NewRegistration(parameters, parameters.length, pool.FeeProvider.Fee());
    }


   function SetPrice(
        uint256 _poolId, 
        uint256 _price, 
        address _token
        ) 
        public 
        onlyOwnerOrGov
        isCorrectPoolId(_poolId)
    {
        require(_poolId > 0, "Incorrect pool id.");

        RegistrationPool storage pool = RegistrationPools[_poolId];
        if (pool.FeeProvider.FeeToken() != address(0)) {
            pool.FeeProvider.SetFeeToken(_token);
        }
        pool.FeeProvider.SetFeeAmount(_price);
        require(pool.FeeProvider.Fee() == _price, "Price was not changed.");

        emit RegistrationPriceChanged(_poolId, _token, _price);
    }
}