// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/ETHHelper.sol";
import "poolz-helper-v2/contracts/GovManager.sol";
import "poolz-helper-v2/contracts/FeeHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, FeeHelper, ETHHelper {
    event PoolCreationPriceChanged(uint256 NewPrice, uint256 OldPrice);

    function SetPoolCreationPrice(address _token, uint256 _price)
        external
        onlyOwnerOrGov
    {
        uint256 oldPrice = BaseFee.Fee();

        if (_token != address(0)) {
            SetToken(_token);
        }
        SetFee(_price);
        require(BaseFee.Fee() == _price, "Price was not changed.");

        emit PoolCreationPriceChanged(_price, oldPrice);
    }
}
