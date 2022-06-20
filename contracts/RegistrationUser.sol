// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
    function AddValue(
        uint256 _poolId, 
        uint256 _keyId, 
        string memory _value
        ) 
        public payable 
        isCorrectPoolId(_poolId)
        returns(uint256) 
    {

    }
}