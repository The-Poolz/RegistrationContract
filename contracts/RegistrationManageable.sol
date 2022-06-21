// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/ETHHelper.sol";
import "poolz-helper-v2/contracts/GovManager.sol";
import "poolz-helper-v2/contracts/FeeHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, GovManager, ETHHelper, ERC20Helper {
    event NewRegistration(
        Company RegisteredCompany,
        string[] Keys,
        string[] Values,
        uint256 ParamsLength,
        uint256 Price
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
        RegistrationPool memory pool = RegistrationPools[_poolId];
        pool.FeeProvider.PayFee(pool.FeeProvider.Fee());
    }

    function CreateNewRegistrationPool(
        address _token,
        uint256 _fee
    ) external {

        RegistrationPools[++TotalPools] = RegistrationPool(
            msg.sender,
            true,
            new FeeBaseHelper(),
            0
        );

        RegistrationPool memory newPool = RegistrationPools[TotalPools];

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
        string[] memory _keys, 
        string[] memory _values
        ) 
        public payable 
        isCorrectPoolId(_poolId)
    {
        require(_keys.length > 0 && _values.length > 0, 
                "Keys and values arrays must have elements.");
        require(_keys.length == _values.length, "Keys and values arrays length must be equal.");

        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.PayFee(pool.FeeProvider.Fee());

        uint256 totalCompanies = ++RegistrationPools[_poolId].TotalCompanies;
        Companies[totalCompanies] = Company(
            _poolId, 
            totalCompanies,
            _keys,
            _values
        );

        emit NewRegistration(Companies[totalCompanies], _keys, _values, _keys.length, pool.FeeProvider.Fee());
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

        RegistrationPool memory pool = RegistrationPools[_poolId];
        if (pool.FeeProvider.FeeToken() != address(0)) {
            pool.FeeProvider.SetFeeToken(_token);
        }
        pool.FeeProvider.SetFeeAmount(_price);
        require(pool.FeeProvider.Fee() == _price, "Price was not changed.");

        emit RegistrationPriceChanged(_poolId, _token, _price);
    }
}