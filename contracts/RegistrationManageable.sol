// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/FeeHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, FeeHelper {
    event PoolCreationPriceChanged(uint256 NewPrice, uint256 OldPrice);
    event PoolCreationTokenChanged(address NewToken, address OldToken);

    function SetTokenPoolCreation(address _token)
        external
        onlyOwnerOrGov
    {
        address oldToken = BaseFee.FeeToken();
        SetToken(_token);

        emit PoolCreationTokenChanged(_token, oldToken);
    }

    function SetPoolCreationPrice(uint256 _price)
        external
        onlyOwnerOrGov
    {
        uint256 oldPrice = BaseFee.Fee();
        SetFee(_price);

        emit PoolCreationPriceChanged(_price, oldPrice);
    }
}
