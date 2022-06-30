// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x84522c47(bytes32 c__0x84522c47) pure {}


import "./RegistrationEvents.sol";

/// @title contains all modifiers and stores variables.
contract RegistrationModifiers is RegistrationEvents {
function c_0xd374fd02(bytes32 c__0xd374fd02) internal pure {}

    modifier isCorrectPoolId(uint256 _poolId) {c_0xd374fd02(0x60f24ce7ae6feea19939f67b9fe155b6355c178e2a2e948aead1a55e2b21c619); /* function */ 

c_0xd374fd02(0x1f950457f546621718c5acabaa45b2785adcd73ebd53a0f35939a1cf7b392aeb); /* line */ 
        c_0xd374fd02(0x71650af0d62e9d766aa12fa36d7af5770baf202c90eaf6ea361c50363fda289b); /* requirePre */ 
c_0xd374fd02(0x5f4df3182b7792ac1423ae589b357cd1f2f7da6adab0d54bef79530bb9b0781e); /* statement */ 
require(_poolId < TotalPools, "Incorrect pool id.");c_0xd374fd02(0x687dce498f360990be32df44c946733b4b199bd70ba75874bbbe79d080e42118); /* requirePost */ 

c_0xd374fd02(0xc4dad73d8021205ebedea31f3549dec97d8fa38e04e45fc28294aa387055e31b); /* line */ 
        _;
    }

    modifier onlyPoolOwner(uint256 _poolId) {c_0xd374fd02(0xd336111789e3fdd2c67fa2adb707b9946e80ef80d00d5e07ca9c86098905d559); /* function */ 

c_0xd374fd02(0x8004844203974e91317ae9287d6bf3d0840968b8d86d765e07fd468c748a8b76); /* line */ 
        c_0xd374fd02(0xe15562c10168c321f8075c7e2a305cd1555c4e40ec20665a85645079802f82b4); /* requirePre */ 
c_0xd374fd02(0x82c924b04c7771732e26c127f9b57493f7efecfdcc05c0689dfd1889048de50b); /* statement */ 
require(
            RegistrationPools[_poolId].Owner == msg.sender,
            "You are not an owner of pool."
        );c_0xd374fd02(0xda9ce677c62707f4ed8e9c4e90efeea9aee82266dfef6b5120041aa1862b7b9a); /* requirePost */ 

c_0xd374fd02(0xf85edc606c7cc3bc3a77b76d2207ca08bcc6c69c6f39f8eff33f2005ad04916e); /* line */ 
        _;
    }

    modifier mustHaveElements(string[] memory data) {c_0xd374fd02(0x784e71f59e366d959ee8b8b64535b30e6ebc3aba34909726192a06262a391d98); /* function */ 

c_0xd374fd02(0x38dfd930b30a6a9caf4cbcc7df09abea9f8747554230d8ea5dc48f8bf959dfc1); /* line */ 
        c_0xd374fd02(0x66e79e61845cb1efbf0b785121f8c61fdd6ab4401a515c6ec86b583fad08913f); /* requirePre */ 
c_0xd374fd02(0x7f43c625adbc9b804fbb10e62794c2db77048acd08c7a4a9475aff1a0cf41191); /* statement */ 
require(data.length > 0, "Data array must have elements.");c_0xd374fd02(0x197d517ece14c55c88298a534e852b46ee2bb696ed17b16fc41c59f22fa46f50); /* requirePost */ 

c_0xd374fd02(0x57a2494041c0c3e4ad94c3c12a7bd84d4a109f1f33a53c18580db7fa05af39c9); /* line */ 
        _;
    }

    modifier validateStatus(uint256 _poolId, bool _status) {c_0xd374fd02(0xb6bcba617f3989ca12e989db69134b707a70e081c27632ae0ef1ef026e6fbca9); /* function */ 

c_0xd374fd02(0x860af1d67f4a52aac3a14807ba80c9128735683a7b9308081ac31099301e04dc); /* line */ 
        c_0xd374fd02(0xc498370d5e5241ae922917ca39886ece413c1b419734ec3224ec7afa7e0029e6); /* requirePre */ 
c_0xd374fd02(0x93b2c1cce37322bf3bbffac011ade582d0ff98bdcf1ed3ec918b5003676e241e); /* statement */ 
require(
            RegistrationPools[_poolId].IsActive == _status,
            "Pool already has the same status."
        );c_0xd374fd02(0xdc41a58eb5350912da791661d9d9a0c017512ba346f9c08285f0d251da518a00); /* requirePost */ 

c_0xd374fd02(0xd8750933d4a6f19cd19a03d1df1b0d0039d918b7de1cd055d47247cc59501d68); /* line */ 
        _;
    }
}
