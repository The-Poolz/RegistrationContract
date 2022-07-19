// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationManageable.sol";

/// @title contains all modifiers
/// @author The-Poolz contracts team
/// @notice You can use this contract for only the most basic simulation
/// @dev This is not a final version of the contract and it can be improved further
contract RegistrationPO is RegistrationManageable {
    /// @notice It allows a user to create a new registration pool
    /// @param _token A token fee of signing up by user
    /// @param _fee A fee for a signing up in the pool
    /// @param _keys The string values of keys that must be filled by user
    function Register(
        address _token,
        uint256 _fee,
        string[] memory _keys
    ) external payable whenNotPaused {
        PayFee(Fee);

        RegistrationPool storage newPool = RegistrationPools[TotalPools];
        newPool.Owner = msg.sender;
        newPool.Keys = _keys;
        newPool.IsActive = true;
        newPool.FeeProvider = new FeeBaseHelper();
        newPool.UserSignUps = 0;
        newPool.TotalKeys = _keys.length;
        MyPools[msg.sender].push(TotalPools);

        emit NewRegistrationPoolCreated(
            TotalPools,
            _keys,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );

        SetRegisterFee(TotalPools++, _token, _fee);
    }

    /// @notice It allows a pool owner to set a new register fee
    /// @param _poolId An id of a pool
    /// @param _token A token fee of signing up by user
    /// @param _price A price of signing up by user
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

    /// @notice It allows a pool owner to withdraw a pool fee
    /// @param _poolId An id of a pool
    function WithdrawPoolFee(uint256 _poolId)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
    {
        FeeBaseHelper PoolFee = RegistrationPools[_poolId].FeeProvider;
        PoolFee.WithdrawFee(payable(RegistrationPools[_poolId].Owner));
    }

    /// @notice It allows a pool owner to activate a pool
    /// @param _poolId An id of a pool
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

    /// @notice It allows a pool owner to deactivate a pool
    /// @param _poolId An id of a pool
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

    /// @notice You can get all of your pool ids by calling this function
    /// @return ids The ids of your pools
    function GetMyPoolIds() external view returns (uint256[] memory) {
        return MyPools[msg.sender];
    }
}
