// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
   function AddKey(
      uint256 _poolId, 
      string memory _key
      ) 
      public payable 
      isCorrectPoolId(_poolId)
      returns(uint256) 
   {

   }
}