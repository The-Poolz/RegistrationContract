// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
    function Register(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external whenNotPaused mustHaveElements(_keys) {
        PayFee(Fee);
        uint256[] memory signUpIds;
        RegistrationPools[TotalPools] = RegistrationPool(
            msg.sender,
            _keys,
            signUpIds,
            true,
            new FeeBaseHelper(),
            0,
            _keys.length
        );
        RegistrationPool storage newPool = RegistrationPools[TotalPools];

        if (_token != address(0)) {
            newPool.FeeProvider.SetFeeToken(_token);
        }
        if (_fee != 0) {
            newPool.FeeProvider.SetFeeAmount(_fee);
        }

        emit NewRegistrationPoolCreated(
            TotalPools,
            _keys,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
        TotalPools++;
    }

    function SetRegisterToken(uint256 _poolId, address _token)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.SetFeeToken(_token);
    }

    function SetRegisterPrice(uint256 _poolId, uint256 _price)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {
        RegistrationPool storage pool = RegistrationPools[_poolId];
        pool.FeeProvider.SetFeeAmount(_price);
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
