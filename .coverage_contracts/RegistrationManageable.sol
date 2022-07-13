// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x83cc4356(bytes32 c__0x83cc4356) pure {}


import "./RegistrationPublic.sol";

/// @title contains admin's actions
contract RegistrationManageable is RegistrationPublic, FeeBaseHelper {
function c_0x67e36802(bytes32 c__0x67e36802) internal pure {}

    function Pause() external onlyOwnerOrGov {c_0x67e36802(0x01114fcfb8c6d97891a0203e37c2bf14c19fd04422bca509d9568fe76af907f2); /* function */ 

c_0x67e36802(0x66e97a007575e7d13f3fea337278a64d96137537b0a1eda0522556016fe5bb95); /* line */ 
        c_0x67e36802(0x380879c71b7665453b5723eee83aa5426d110652cef7b0b1d559c94fffaba803); /* statement */ 
_pause();
    }

    function Unpause() external onlyOwnerOrGov {c_0x67e36802(0x46cc58194fb48441ea315d8bcfb2357bc067f8ca902523b8d5ce96221485961e); /* function */ 

c_0x67e36802(0x0e87a9adeb45e63875085796f451ca241184d8a055f9812c536c04880c3955d9); /* line */ 
        c_0x67e36802(0xbe0b3decab621fe336c01f6851c5651b8efb5fa5a4cc613c4013b1fac0ddb228); /* statement */ 
_unpause();
    }
}
