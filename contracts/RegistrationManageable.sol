// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/FeeHelper.sol";

import "./RegistrationData.sol";

contract RegistrationManageable is RegistrationData, FeeHelper {
    event PoolCreationPriceChanged(uint256 NewPrice, uint256 OldPrice);
    event PoolCreationTokenChanged(address NewToken, address OldToken);

    modifier isCorrectTokenAddress(address _token) {
        require(_token != address(0), "Invalid token address.");
        _;
    }

    modifier isCorrectPrice(uint256 _price) {
        require(_price >= 0, "Price must be equal or greater than zero.");
        _;
    }

    function SetTokenPoolCreation(address _token)
        external
        onlyOwnerOrGov
        isCorrectTokenAddress(_token)
    {
        address oldToken = BaseFee.FeeToken();
        SetToken(_token);

        emit PoolCreationTokenChanged(_token, oldToken);
    }

    function SetPoolCreationPrice(uint256 _price)
        external
        onlyOwnerOrGov
        isCorrectPrice(_price)
    {
        uint256 oldPrice = BaseFee.Fee();
        SetFee(_price);

        emit PoolCreationPriceChanged(_price, oldPrice);
    }
}
