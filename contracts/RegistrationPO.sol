// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
    function Register(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external payable whenNotPaused mustHaveElements(_keys) {
        PayFee(Fee);

        RegistrationPool storage newPool = RegistrationPools[TotalPools];
        newPool.Owner = msg.sender;
        newPool.Keys = _keys;
        newPool.IsActive = true;
        newPool.FeeProvider = new FeeBaseHelper();
        newPool.UserSignUps = 0;
        newPool.TotalKeys = _keys.length;

        SetRegisterFee(TotalPools, _token, _fee);

        emit NewRegistrationPoolCreated(
            TotalPools,
            _keys,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
        TotalPools++;
    }

    function SetRegisterFee(
        uint256 _poolId,
        address _token,
        uint256 _price
    ) public whenNotPaused onlyPoolOwner(_poolId) isCorrectPoolId(_poolId) {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        if (pool.FeeProvider.FeeToken() != _token) {
            pool.FeeProvider.SetFeeToken(_token);
        }
        if (pool.FeeProvider.Fee() != _price) {
            pool.FeeProvider.SetFeeAmount(_price);
        }
    }

    function WithdrawPoolFee(uint256 _poolId)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
    {
        FeeBaseHelper PoolFee = RegistrationPools[_poolId].FeeProvider;
        PoolFee.WithdrawFee(payable(RegistrationPools[_poolId].Owner));
    }

    function ActivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, false)
    {
        RegistrationPools[_poolId].IsActive = true;
        emit RegistrationPoolActivated(_poolId);
    }

    function DeactivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, true)
    {
        RegistrationPools[_poolId].IsActive = false;
        emit RegistrationPoolDeactivated(_poolId);
    }
}
