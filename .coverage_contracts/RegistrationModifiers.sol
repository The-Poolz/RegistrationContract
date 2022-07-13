// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x9c42a1d4(bytes32 c__0x9c42a1d4) pure {}


import "./RegistrationEvents.sol";

/// @title contains all modifiers
contract RegistrationModifiers is RegistrationEvents {
function c_0xa88b1bfc(bytes32 c__0xa88b1bfc) internal pure {}

    modifier isCorrectPoolId(uint256 _poolId) {c_0xa88b1bfc(0x611b3635146a2046a9f124f2c5b417c37beea3517b600d637a3d4d2f5f071025); /* function */ 

c_0xa88b1bfc(0x518ab2111ab5580214bc1e2d88941203cf839b22e276ca24b02e653b842981e2); /* line */ 
        c_0xa88b1bfc(0xcc7512cde8e870116f6ea4a30ac03e8342b2df8ec51037648bf7952ddcedb1dd); /* requirePre */ 
c_0xa88b1bfc(0x442639ff98000aab290673149e0abf15c16854310a9fd51758d9c9627a6fd366); /* statement */ 
require(_poolId < TotalPools, "Incorrect pool id.");c_0xa88b1bfc(0x2eb7ab22c509ca42c1a11cebe931bb43846816ca6cc5e0f6825cf5cff97c7524); /* requirePost */ 

c_0xa88b1bfc(0x1911058c05ce9212f607c9258533e10bb3dc888bcc9c4a48ffe6506bbc6d054a); /* line */ 
        _;
    }

    modifier isCorrectSignUpId(uint256 _poolId, uint256 _signUpId) {c_0xa88b1bfc(0xeff6237beedd337823f86fbc5a6ee4f22ebe6f58b0a5bcaa9ec0a2f917ee101f); /* function */ 

c_0xa88b1bfc(0x843a13cf3fd57fd14273b72da06039bb6b9d9b82b06f45d8018aabe6f6da5acb); /* line */ 
        c_0xa88b1bfc(0x281d8fdab833cc3501d3ef42843fcf2b1c28027233681fc76ee9663790d56178); /* requirePre */ 
c_0xa88b1bfc(0x5cb8831e9d696354595292a092b6abf164ac95f56c66321e43e7676490476c04); /* statement */ 
require(
            _signUpId < RegistrationPools[_poolId].UserSignUps,
            "Incorrect SignUp id."
        );c_0xa88b1bfc(0x2778d8b47b0456cfc5aca1d9c436b2c88f6f01650348f9dd1991a51ed130db4a); /* requirePost */ 

c_0xa88b1bfc(0x98f1f675b4229524f93ea8fa0d259c410b4abf27f5bc4a1f052788105d8bedb0); /* line */ 
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {c_0xa88b1bfc(0x4e0759467fd661ae9a6a10f37dcfef8fe54f485cd0007653fa25a5263d8d5ef0); /* function */ 

c_0xa88b1bfc(0xec7b5d8b4bc6144e663e4f1e5c38779b7cb2ed9eb075e196dc2bc50defe8d7ec); /* line */ 
        c_0xa88b1bfc(0xcbabf71c04402477eff030d63534e5944202a79fd8752ca46834fb81f75b179f); /* requirePre */ 
c_0xa88b1bfc(0x1a17aa52c6b059f03334572c62e20f855b0483a4ab6bdb9dd1a8cabfe85fe620); /* statement */ 
require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
        );c_0xa88b1bfc(0xc55a674db616bc1d6a6fe73764c60df67eb3cef59eaff6a58559c1e6561b2e8d); /* requirePost */ 

c_0xa88b1bfc(0x8f2dfc84d8e31a22dde438b6829f9c39ea2aa8cd2fd8e1562bf5fb08dac1e431); /* line */ 
        _;
    }

    modifier onlySignUpOwner(uint256 _poolId, uint256 _signUpId) {c_0xa88b1bfc(0xecb3f5203887837e44ba3ea4bef13dc1c96a78f5e31ee60a77a96da548366a6f); /* function */ 

c_0xa88b1bfc(0x6bf34ecf646274db02b1ee8c356d52e9b953faca60bf4ce8ded615a0be348f7a); /* line */ 
        c_0xa88b1bfc(0x9547dd96659e3445e45525109adace3ee229cfa28038701ae5ce440b0ad0c491); /* requirePre */ 
c_0xa88b1bfc(0xd892de752fa9431cd1ff7d29bfc0a52df5e5d5926e14824b665743b84b7ca515); /* statement */ 
require(
            RegistrationPools[_poolId].SignUpPools[_signUpId].Owner ==
                msg.sender,
            "You are not an owner of SignUp."
        );c_0xa88b1bfc(0xe5c30c5fcd2ea3257ce6ca20f59cdc0cf86f5437d8d3558535ce98f29fe6f7bc); /* requirePost */ 

c_0xa88b1bfc(0x93930a514bd4b8b958df22908a6eacaeea5fc3fca0096260c673c8f6e5d376ad); /* line */ 
        _;
    }

    modifier mustHaveElements(string[] memory data) {c_0xa88b1bfc(0x4cfee26a29f160885c40e615741edbecb77923e71bb57553d4b62797ea49a610); /* function */ 

c_0xa88b1bfc(0x87434e53cf619f2d5369bf121fd6e0a87e3b2b5fdc7ab3c4413f7a9e5283ab92); /* line */ 
        c_0xa88b1bfc(0x91139801d7817483bb7f077ffd0a3518353ba8e3ca8f948a4518108e6b6e8b1a); /* requirePre */ 
c_0xa88b1bfc(0x36dec73c72eaca7100b3c68663885ee40640d9eda209a0bc2b51d7e711af96a9); /* statement */ 
require(data.length > 0, "Data array must have elements.");c_0xa88b1bfc(0x12f7a294fcb05a9b741451e23378b91dc25506a8ff06f07b8b6c7387923b3029); /* requirePost */ 

c_0xa88b1bfc(0x4b1c0eafd7d3236f49e25fb95b1b8d39fbc5f37fc1ec96468747438413c28869); /* line */ 
        _;
    }

    modifier validateStatus(uint256 _poolId, bool _status) {c_0xa88b1bfc(0xfe18cfd870336e71e208450b2be96a874de37f3673fdcf2a84a3308112738f43); /* function */ 

c_0xa88b1bfc(0xd5ad7afe0721b0795eda03a11958652587babf34f386b4b5d59af0e56411fbee); /* line */ 
        c_0xa88b1bfc(0x07d79caeb95ab90503f81ddc9dfb0c307d137e1040a6fff505139f391aa4c743); /* requirePre */ 
c_0xa88b1bfc(0x1562be93b006500b4ab8dd5963b154bd710aa944636d1a23e585e6761eff48a8); /* statement */ 
require(
            RegistrationPools[_poolId].IsActive == _status,
            "Pool already has the same status."
        );c_0xa88b1bfc(0x08b7c340549d0cb5ccd5eb0ea77f4a4e8691d565a2ce1b9c103347e3e65dac55); /* requirePost */ 

c_0xa88b1bfc(0xfb1113cf871ebfee7476a284c84a268f46cddac632aafd8924423de89d11312f); /* line */ 
        _;
    }

    modifier sameLenghtArrays(string[] memory arr1, string[] memory arr2) {c_0xa88b1bfc(0x8fb03530a5ea8b3c1ec9dba08fddba1d2524395e5fa5a917c9365ca8984ff723); /* function */ 

c_0xa88b1bfc(0x9f3f7dc29d8e65f3ad412f2470c50981aa4c0ec0298e982e55c3483ae5a295f3); /* line */ 
        c_0xa88b1bfc(0x5f7d802773beedd53015994ab16587c5d4724b3dee9c9e7d635533c64fea0a7d); /* requirePre */ 
c_0xa88b1bfc(0xd6bc236855fd48336223d901209760aeee556a5615945b7d355a01faa5738cdb); /* statement */ 
require(
            arr1.length == arr2.length,
            "Both arrays must have the same length."
        );c_0xa88b1bfc(0x212aa6de1ae83a0aa6176cda6442aca4481ee220e66497b8f904e3c41a0e8c95); /* requirePost */ 

c_0xa88b1bfc(0x8ea0ba05c79f707e6a30ad03f6e9165f445aa70469c1a028f4c3d4edd182ab7d); /* line */ 
        _;
    }
}
