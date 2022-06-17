// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/ERC20Helper.sol";
import "poolz-helper-v2/contracts/ETHHelper.sol";

contract Registration is GovManager, ETHHelper, ERC20Helper {

    uint256 price;
    mapping(string => string) parameters;

    event SaveParameterValue(
        string Key,
        string Value
    );

    event Registered(
        uint256 Price,
        uint256 ParamLength
    );
    
    function Register(string[] memory _parameters, string[] memory _values) public payable {
        require(_parameters.length > 1 && _values.length > 1, 
                "Parameters and values arrays must have more than one element.");
        require(_parameters.length == _values.length, "Parameters and values arrays length must be equal.");
        require(msg.value >= price, "Value must be equal or greater than price.");

        for (uint i = 0; i < _values.length; i++) {
            parameters[_parameters[i]] = _values[i];
            emit SaveParameterValue(_parameters[i], _values[i]);
        }
        emit Registered(price, _parameters.length);
    }

    function setPrice(uint256 _price) external onlyOwnerOrGov {
        price = _price;
    }
}