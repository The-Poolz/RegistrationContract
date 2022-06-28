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

    event RegistrationTokenChanged(
        uint256 PoolId,
        address NewToken,
        address OldToken
    );

    event RegistrationPriceChanged(
        uint256 PoolId,
        uint256 NewPrice,
        uint256 OldPrice
    );

    event RegistrationPoolActivated(uint256 PoolId);
    event RegistrationPoolDeactivated(uint256 PoolId);

    modifier isCorrectPoolId(uint256 _poolId) {
        require(_poolId >= 0 && _poolId < TotalPools, "Incorrect pool id.");
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

    modifier validateStatus(uint256 _poolId, bool _status) {
        require(
            RegistrationPools[_poolId].IsActive == _status,
            "Pool already has the same status."
        );
        _;
    }

    function CreateNewRegistrationPool(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external mustHaveElements(_keys) {
        PayFee();
        uint256[] memory companyIds;
        RegistrationPools[TotalPools] = RegistrationPool(
            msg.sender,
            _keys,
            companyIds,
            true,
            new FeeBaseHelper(),
            0
        );
        RegistrationPool memory newPool = RegistrationPools[TotalPools];

        if (_token != address(0)) {
            newPool.FeeProvider.SetFeeToken(_token);
            require(
                newPool.FeeProvider.FeeToken() == _token,
                "Token was not set."
            );
        }
        if (_fee != 0) {
            newPool.FeeProvider.SetFeeAmount(_fee);
            require(
                newPool.FeeProvider.Fee() == _fee,
                "Price was not changed."
            );
        }

        emit NewRegistrationPoolCreated(
            TotalPools,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
        TotalPools++;
    }

    function SetRegisterToken(uint256 _poolId, address _token)
        external
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {
        RegistrationPool memory pool = RegistrationPools[_poolId];

        address oldToken = pool.FeeProvider.FeeToken();
        pool.FeeProvider.SetFeeToken(_token);
        require(pool.FeeProvider.FeeToken() == _token, "Token was not set.");

        emit RegistrationTokenChanged(_poolId, _token, oldToken);
    }

    function SetRegisterPrice(uint256 _poolId, uint256 _price)
        external
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {
        RegistrationPool memory pool = RegistrationPools[_poolId];

        uint256 oldPrice = pool.FeeProvider.Fee();
        pool.FeeProvider.SetFeeAmount(_price);
        require(pool.FeeProvider.Fee() == _price, "Price was not changed.");

        emit RegistrationPriceChanged(_poolId, _price, oldPrice);
    }

    function ActivatePool(uint256 _poolId)
        external
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, false)
    {
        RegistrationPools[_poolId].IsActive = true;
        emit RegistrationPoolActivated(_poolId);
    }

    function DeactivatePool(uint256 _poolId)
        external
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, true)
    {
        RegistrationPools[_poolId].IsActive = false;
        emit RegistrationPoolDeactivated(_poolId);
    }
}