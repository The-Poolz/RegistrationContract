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

    function CreateNewRegistrationPool(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external mustHaveElements(_keys) {
        PayFee(Fee);
        uint256[] memory companyIds;
        RegistrationPools[TotalPools] = RegistrationPool(
            msg.sender,
            _keys,
            companyIds,
            true,
            new FeeBaseHelper(),
            0
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
        RegistrationPool storage pool = RegistrationPools[_poolId];

        address oldToken = pool.FeeProvider.FeeToken();
        pool.FeeProvider.SetFeeToken(_token);

        emit RegistrationTokenChanged(_poolId, _token, oldToken);
    }

    function SetRegisterPrice(uint256 _poolId, uint256 _price)
        external
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {
        RegistrationPool storage pool = RegistrationPools[_poolId];

        uint256 oldPrice = pool.FeeProvider.Fee();
        pool.FeeProvider.SetFeeAmount(_price);

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
