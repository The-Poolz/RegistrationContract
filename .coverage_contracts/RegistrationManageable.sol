// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x0986a727(bytes32 c__0x0986a727) pure {}


import "./RegistrationModifiers.sol";

import "@openzeppelin/contracts/security/Pausable.sol";

/// @title contains all modifiers and stores variables.
contract RegistrationManageable is RegistrationModifiers, FeeBaseHelper, Pausable {
function c_0xfabe27fe(bytes32 c__0xfabe27fe) internal pure {}

    function Pause() external onlyOwnerOrGov {c_0xfabe27fe(0xca017632ad5dc9ff684b0078c86ab28fb3a10706456dd2a2884e700f369ddc10); /* function */ 

c_0xfabe27fe(0xc97cb58919b9b78b0b24c317811cefcfbd1631c80d6c619ee96fd790ca68bf49); /* line */ 
        c_0xfabe27fe(0x258f82206a64c4f4577b99e1d64849d540c46c3fead46f74a877f5a6fca5409f); /* statement */ 
_pause();
    }

    function Unpause() external onlyOwnerOrGov {c_0xfabe27fe(0x9e04160fcda4304099ac7cca9b0c75a7bcaaab5c3eca756885ba9cb7b1f9df56); /* function */ 

c_0xfabe27fe(0x78ca0914cfb89b97825648053e218be2e93db0b7f2eae6a3fe3bb57f7febcc2a); /* line */ 
        c_0xfabe27fe(0x9c8c1eca4b3ee059c412233af53693e3da035878c4b4fb7f3396de4c52ed7363); /* statement */ 
_unpause();
    }
}