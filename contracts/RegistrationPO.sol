// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
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

    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId > 0, "Incorrect pool id.");
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {
        require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
        );
        _;
    }

   modifier mustHaveElements(string[] memory data) {
        require(data.length > 0, "Data array must have elements.");
        _;
    }

    function CreateNewRegistrationPool(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external mustHaveElements(_keys) {
        PayFee();
        RegistrationPools[++TotalPools] = RegistrationPool(
            msg.sender,
            _keys,
            true,
            new FeeBaseHelper(),
            0
        );

        SetRegisterPrice(TotalPools, _token, _fee);
        RegistrationPool memory newPool = RegistrationPools[TotalPools];

        emit NewRegistrationPoolCreated(
            TotalPools,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
    }

    function SetRegisterPrice(
        uint256 _poolId,
        address _token,
        uint256 _price
    ) public onlyPoolOwner(_poolId) isCorrectPoolId(_poolId) {
        RegistrationPool memory pool = RegistrationPools[_poolId];
        if (pool.FeeProvider.FeeToken() != address(0)) {
            pool.FeeProvider.SetFeeToken(_token);
        }
        pool.FeeProvider.SetFeeAmount(_price);
        require(pool.FeeProvider.Fee() == _price, "Price was not changed.");

        emit RegistrationPriceChanged(_poolId, _token, _price);
    }
}
