// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x588a1d9e(bytes32 c__0x588a1d9e) pure {}


import "@openzeppelin/contracts/security/Pausable.sol";
import "./RegistrationModifiers.sol";

/// @title allows to get pool's keys or SignUp's values
contract RegistrationPublic is RegistrationModifiers, Pausable {
function c_0x34973d53(bytes32 c__0x34973d53) internal pure {}

    function GetKeys(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (string[] memory)
    {c_0x34973d53(0xb30c3a850bee7919fb9edbb9482690f3b50b84596102e3229a27541c46b923c7); /* function */ 

c_0x34973d53(0x9a6f5d43a99aaf198b27949604b37cdac11d64a37a6d477cf7c1c506738df87e); /* line */ 
        c_0x34973d53(0x4626901c6449ab742e7275f1cfd4964967c6ada510b940452df82eb7c6702d24); /* statement */ 
return RegistrationPools[_poolId].Keys;
    }

    function GetValues(uint256 _poolId, uint256 _signUpId)
        external
        view
        isCorrectPoolId(_poolId)
        isCorrectSignUpId(_poolId, _signUpId)
        returns (string[] memory)
    {c_0x34973d53(0x6cb8c9f5dc382d33e6fa20b72f52c9480c84b6e2202acbd9fd694e759b4bf2d4); /* function */ 

c_0x34973d53(0x386e6e0095835b6f4b7ba909664bf7b628cb79cbe89a2cf31fc3a190d9e63883); /* line */ 
        c_0x34973d53(0x80b2e3e939214874a7b3c346459505baef7ef89a483fe899e301990b19218106); /* statement */ 
return RegistrationPools[_poolId].SignUpPools[_signUpId].Values;
    }
}
