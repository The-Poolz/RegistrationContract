// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x898cb609(bytes32 c__0x898cb609) pure {}


import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
function c_0xa3bae51f(bytes32 c__0xa3bae51f) internal pure {}

    function SignUp(uint256 _poolId, string[] memory _values)
        external
        payable
        whenNotPaused
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
        validateStatus(_poolId, true)
        sameLenghtArrays(RegistrationPools[_poolId].Keys, _values)
    {c_0xa3bae51f(0x42a6b02848cc6c1a5a4d0bcbc146229b309cb2b73ee781a86b1026d38fab1ec0); /* function */ 

c_0xa3bae51f(0x50fb1873cddab56b9db1b484e2abe26ad5d5adfe19fa758ece67f6de1d71a856); /* line */ 
        c_0xa3bae51f(0xc2681dfc9c64dbdddd7c1a230f3c9cc5ab48565a8e08fa5c418030509a66e9db); /* statement */ 
RegistrationPool storage pool = RegistrationPools[_poolId];
c_0xa3bae51f(0xe456519ac997a6e1d331c8a63fd061082175d49846d82be22d194be54f37f355); /* line */ 
        c_0xa3bae51f(0xfe197297db1f38f09275fb5e6e2c0740898d41f429d9b4bbdedd546444a683d9); /* statement */ 
pool.FeeProvider.PayFee{value: msg.value}(pool.FeeProvider.Fee());

c_0xa3bae51f(0x4909dc666aeee193ab63bbc69ce4e173cde11773e920b5747a514b9cb1dd071d); /* line */ 
        c_0xa3bae51f(0x8b08391eac53290c93881ba2f1e9422a73821533bbf4f338818e19b1217a9e35); /* statement */ 
pool.SignUpPools[pool.UserSignUps] = SignUpPool(
            msg.sender,
            _poolId,
            pool.UserSignUps,
            _values
        );

c_0xa3bae51f(0xd656a477a3e87c983968ca5a8e43a84c0bc8d283e3cd26dec710f89e9e6cce3a); /* line */ 
        c_0xa3bae51f(0x0ab5dd115d7817b9627f86858eefed48b6f3bf9daa9bb03ec32f366480974a26); /* statement */ 
emit NewRegistration(_poolId, pool.UserSignUps, _values);
c_0xa3bae51f(0x41a006d61994e17d7cadf87440b43f95bf9ca4349e5d5ea13a54f70ca0ef08aa); /* line */ 
        pool.UserSignUps++;
    }

    function EditValues(
        uint256 _poolId,
        uint256 _signUpId,
        string[] memory _values
    )
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        isCorrectSignUpId(_poolId, _signUpId)
        mustHaveElements(_values)
        onlySignUpOwner(_poolId, _signUpId)
        sameLenghtArrays(
            RegistrationPools[_poolId].SignUpPools[_signUpId].Values,
            _values
        )
    {c_0xa3bae51f(0x1792507e344bffd69c59d15503a765f130b2f3b63bf5fde0f119ebd78425a3d9); /* function */ 

c_0xa3bae51f(0x983d5f4ac2af95e44e91b9fd065890c6dcaf13e29eb58f1c252267c773b560a3); /* line */ 
        c_0xa3bae51f(0xa8bbd762126c0ce7c9ee418f1498ccd9bc189d61d854579f60c545480c52ab75); /* statement */ 
string[] memory oldValues = RegistrationPools[_poolId]
            .SignUpPools[_signUpId]
            .Values;
c_0xa3bae51f(0x77f3901aeb7577b245eaa022ca96010ec559ece7cee8a205a3f1434b2c9946f6); /* line */ 
        c_0xa3bae51f(0xbb5b5907e0ee0594d5dfaff2f367a20408186733043dd1dafb6655bf07896287); /* statement */ 
RegistrationPools[_poolId].SignUpPools[_signUpId].Values = _values;

c_0xa3bae51f(0x0015ee37c7d19a947751d4781e47cc7d1d41cef0e4fa39036c7094fce7a19599); /* line */ 
        c_0xa3bae51f(0x3bdcee26df7f7136a99eebe29e29542197d608831ec4235fbf55b8e293ff1a30); /* statement */ 
emit SignUpValuesChanged(_values, oldValues);
    }

    function GetAllMySignUpIds(uint256 _poolId)
        external
        view
        isCorrectPoolId(_poolId)
        returns (uint256[] memory)
    {c_0xa3bae51f(0x0a68e93b072e0f2509cb48bbc71552b156a87116b91e8ca3ed34d663926f13b2); /* function */ 

c_0xa3bae51f(0xeec891dd98ad22ed8b7cf50f7da3100748f4222a96573c19b2b816ece06fc6df); /* line */ 
        c_0xa3bae51f(0x22ccb5d8584388d22d9e8bc10d61b48e9366223e613815bf8d8563d4c5d319fc); /* statement */ 
uint256 counter = 0;
c_0xa3bae51f(0xeab7d485beac97868ce121f66a0f016db472def5990714d6c49796434975c1e0); /* line */ 
        c_0xa3bae51f(0x8b6d4e455f0a9d8fa1d4ebdecea9f3340d055e62df740cda15ee318fb264018e); /* statement */ 
for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
c_0xa3bae51f(0x3e3f3a5e212e5615c53d88ec6aa33018d84f218a491a911619ea785e060ebdb1); /* line */ 
            c_0xa3bae51f(0xb86dd2ca1fe77295a27ab83fff0b408f71e7452cc5c11342e1b7743b429795e2); /* statement */ 
if (RegistrationPools[_poolId].SignUpPools[i].Owner == msg.sender) {c_0xa3bae51f(0x660707973141f26f654dde01b9a332ea241014010c3d525c88474bac2970b4dc); /* branch */ 

c_0xa3bae51f(0x6145ce116645fa8d0fe2396e7f96a8adb5bd2d7afd5af09b8d44898c9eac9920); /* line */ 
                counter++;
            }else { c_0xa3bae51f(0x98b982ed8d7cac5eee8114e22a3e2a7ebe635260475f1a0f845e5cbf839123f5); /* branch */ 
}
        }

c_0xa3bae51f(0x7ff0dc918847f61b9558210e87a9e33a68fa534d14561b92be46c6ade2ba3d8a); /* line */ 
        c_0xa3bae51f(0x3c11692c8228fd6f20f77fd1a29f77dd2e7dae4f65dcd92b6c873ad995c66959); /* statement */ 
uint256[] memory signUpIds = new uint256[](counter);
c_0xa3bae51f(0x1d9795010b5b60db282387f4c4c189a8f833bc2e96da4945f525994964665917); /* line */ 
        c_0xa3bae51f(0x2be457b789760eb5208907ecac953e65a6893fb58839f22d2aee016deeb64022); /* statement */ 
uint256 j = 0;
c_0xa3bae51f(0x0660a7d06a2d585e215ac9e090639499022963a12ba3974dbe1b260555f71f51); /* line */ 
        c_0xa3bae51f(0x72af6191c708e8d664ebbc918a9ce7e11f6185ba54272ee9249de92828c76f7b); /* statement */ 
for (uint256 i = 0; i < RegistrationPools[_poolId].UserSignUps; i++) {
c_0xa3bae51f(0x66d4fb19880fa3b6b240c174baa6f2c2c6e46c18299e6e1e16f9598913707042); /* line */ 
            c_0xa3bae51f(0x132b58873740c5e488fe018bf54d96f995a182745fe953373d3ad6b0dc74c9b4); /* statement */ 
if (RegistrationPools[_poolId].SignUpPools[i].Owner == msg.sender) {c_0xa3bae51f(0x2bd0a0b0b1a669e2d0f028091372a3020f9375a82f664a364ffb4eb4e89d2431); /* branch */ 

c_0xa3bae51f(0x5d3140e179783848e917bc7af02649bfb3e4517fbb280d8e9bc784a24eefc376); /* line */ 
                c_0xa3bae51f(0x29cd7d0f8367d908e8eb528072a4c1e27059e8d2e2598d5cb44ff3e822e53bbd); /* statement */ 
signUpIds[j++] = i;
            }else { c_0xa3bae51f(0x2f0961549ba1bdad8adb3b10fa65ee878df4f04bc1e3115ba6e73516acb20277); /* branch */ 
}
        }

c_0xa3bae51f(0xeb9c6108ae9d0e75f3a715858af8aa32cc0f132e6882243d9e5f5ebd2cc05085); /* line */ 
        c_0xa3bae51f(0x7717f39bb21775ee5bd46e715371b83e3effa9fc8190d0bb15a4cf27dbbb19da); /* statement */ 
return signUpIds;
    }
}
