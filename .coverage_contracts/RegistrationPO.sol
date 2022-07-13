// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x4481cfe6(bytes32 c__0x4481cfe6) pure {}


import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
function c_0xba3d8062(bytes32 c__0xba3d8062) internal pure {}

    function Register(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external payable whenNotPaused mustHaveElements(_keys) {c_0xba3d8062(0xf5f8c734816458a310dc25b34b459dd725cff461031f4aa1152211635a931cbc); /* function */ 

c_0xba3d8062(0xee893318f4737aef1855e2616407c71caa790ca07a4c94ec4ccc4240b3a5d39a); /* line */ 
        c_0xba3d8062(0xbd7864bcd562595475fd6b2ceb9b1c13293ce298206b98c7f4dd04d905477fbb); /* statement */ 
PayFee(Fee);

c_0xba3d8062(0xe25a4ebb9a807216a7039385d9d7b9d399e81adc753c5dafe37e1cc746c2b686); /* line */ 
        c_0xba3d8062(0x720768026bcc42fad81503dbf7433a3b83b09a9a676afdab50f4f4c483f09794); /* statement */ 
RegistrationPool storage newPool = RegistrationPools[TotalPools];
c_0xba3d8062(0xfac370c519033fdc8e4df68fde127ac27c4203c561b144b7b31de71d5f291c86); /* line */ 
        c_0xba3d8062(0x65bb17ab9d0d648c5f13a8bc4bb854f4a70a482593dc5abb6333e13e34d287fc); /* statement */ 
newPool.Owner = msg.sender;
c_0xba3d8062(0xbb63f3ae34e9da516863fea20a5643ad863ce4414af74fc2186b91498762666f); /* line */ 
        c_0xba3d8062(0x118e07f2b8b1d1105cb7f733b2eb7edeb6759893ddd00897362acc00eb94f436); /* statement */ 
newPool.Keys = _keys;
c_0xba3d8062(0x5d3c1fdb40638287349869941f88100b21add94958653eeded6d99ca2251c291); /* line */ 
        c_0xba3d8062(0xc3fd1243f78c8250d080d40bea76b266bc5f4551c81064911080af7741d3c638); /* statement */ 
newPool.IsActive = true;
c_0xba3d8062(0xc969b2f87e2cb3696e3f529df4bf55ffa19c4c03da82a18f3dbb3b96d3445ce6); /* line */ 
        c_0xba3d8062(0x0faf55d271ba486b5361cf429b7c9f3e75059e6820b58fc18f51d76b39886c1e); /* statement */ 
newPool.FeeProvider = new FeeBaseHelper();
c_0xba3d8062(0xe8760b4d8c272d525980438aa43515dce4af1750e687aec616bc45f043369ca0); /* line */ 
        c_0xba3d8062(0x75bc41b8960a796c3db4ff2f9cdea8284f6f2b9607876344afe91f8de53dfea4); /* statement */ 
newPool.UserSignUps = 0;
c_0xba3d8062(0x0beb0264052be45dc60fefb9276741579e79b188360945b19b3bed340277fa30); /* line */ 
        c_0xba3d8062(0xc35f7dd167f45b0ccc03398f6451dc04795c74da497584748e08287c40a5cddc); /* statement */ 
newPool.TotalKeys = _keys.length;

c_0xba3d8062(0xa38261f6e08841220634397d3abf15cdb768b8d14f01ba38088d530ee44912f1); /* line */ 
        c_0xba3d8062(0x0076646c9eee2e9d74bf93649c861a778e76a1c15d93b97aba2ff1c46a67c3a0); /* statement */ 
if (_token != address(0)) {c_0xba3d8062(0xbf59b2da6c333e138e6e9fe2fb5f85de7ded3299cb1158096b0f6fd934707dd7); /* branch */ 

c_0xba3d8062(0x400abf0d39dc63fd572c6bfc176f627019ace21aa14a7a682cba6b859ed25ef3); /* line */ 
            c_0xba3d8062(0xb9296212a61ee199d7794d70bb0a9427f74eb11c8ff4f97ee03d5b2e5208d304); /* statement */ 
newPool.FeeProvider.SetFeeToken(_token);
        }else { c_0xba3d8062(0x49aefa507218b8a3ff10a6acb506d97e4afd1792fba5df70047615f5c26993c2); /* branch */ 
}
c_0xba3d8062(0x38ab531c4df1127e9489a96a91260eebf7687942c9ad7a865740b81fc4b05ff4); /* line */ 
        c_0xba3d8062(0xaf785bb1dbac4818490e7e3a85a70e946a3db420f5d8de71512c437a7d19ebf7); /* statement */ 
if (_fee != 0) {c_0xba3d8062(0x6879be9b69a7d1cfc01e0e3b30316468e4524d65fe935a92d67b55a7134cf7e2); /* branch */ 

c_0xba3d8062(0xc4d78f304e689d74039a77323d111b6ecad1a9920a95b4a31242e4e254730e66); /* line */ 
            c_0xba3d8062(0xefb798b1ed368aeba92072fd0caaae8b243cb722b6d5edc20c11a3778ab85b05); /* statement */ 
newPool.FeeProvider.SetFeeAmount(_fee);
        }else { c_0xba3d8062(0x56e98075dde79d13d0e91a585a11de6b3443746d1b7800727ea864e4929c0017); /* branch */ 
}

c_0xba3d8062(0xdb94fe93a1ee1ef54f2da382442490ec94a4aade09464ef2d60fb9d9f89e2c5b); /* line */ 
        c_0xba3d8062(0xffba3b410ddf8ecfad211a2ccf0dcb5a025064fefea9416e02204ef282def8cd); /* statement */ 
emit NewRegistrationPoolCreated(
            TotalPools,
            _keys,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
c_0xba3d8062(0xf1bd2081a960a1f53550bda7336c41223c37be182cfa5e0f1139a20d270c7247); /* line */ 
        TotalPools++;
    }

    function SetRegisterFee(
        uint256 _poolId,
        address _token,
        uint256 _price
    ) external whenNotPaused onlyPoolOwner(_poolId) isCorrectPoolId(_poolId) {c_0xba3d8062(0x037bd594d04964452a8a9e7efa10f933d7476d4ac26378d97360229573d291e2); /* function */ 

c_0xba3d8062(0x66e4d535c32e730ef9c5f1f503d53d9e11f7cd168367d2f6653fc73a50df62fa); /* line */ 
        c_0xba3d8062(0x5284ada3ce3338d7ca56cdfe5f0c21a9e11ec42cf518726919e187f949e32cec); /* statement */ 
RegistrationPool storage pool = RegistrationPools[_poolId];
c_0xba3d8062(0xab2f928cf1e1b43b5b184aca6d9c30cc3f3a8c3a9705e2aa4863dd7aeca91eb6); /* line */ 
        c_0xba3d8062(0x70901e40da6fd2eee1ad865f56be0f1240e1fef091f7f15563c75db04b3c6085); /* statement */ 
if (pool.FeeProvider.FeeToken() != _token) {c_0xba3d8062(0xce3d0a08b00a57ee19f5a086b575e82e9b49e22034ddafba30d963dc7da46997); /* branch */ 

c_0xba3d8062(0xddb1add4e1abdb335f448bd161d3619a60351842cb0dfd416effa68d87a68377); /* line */ 
            c_0xba3d8062(0x23c4209e76c09d7afe2b87ec5dfd82cd98174029498390330096ef81457f7ca2); /* statement */ 
pool.FeeProvider.SetFeeToken(_token);
        }else { c_0xba3d8062(0x5980ce5b42bbe7c8d03b82a17bbb18882ce4c17e8107d7e1939b46d4f5cf5b1a); /* branch */ 
}
c_0xba3d8062(0x1e5eb298783b0e128b802c123d22b9f832e626d84389e68cdc4d0dab7a752a14); /* line */ 
        c_0xba3d8062(0x216fd14682be463c69b82b4423ec8fd3614e1bb4214d3672e4eda7bd55b72c37); /* statement */ 
if (pool.FeeProvider.Fee() != _price) {c_0xba3d8062(0x1612593b739bd68b21f87a9a272e4a6c865bf872101292fdf3b6f2900feb6388); /* branch */ 

c_0xba3d8062(0x4c3902ba3e0299e7cf60d590f3c7186286bc6b0c2a4d4c86f7dc26756bdc651c); /* line */ 
            c_0xba3d8062(0xec5da12e95d3aea67f91361d58fd6471f19d2fdf17bdc725038db3d3f6901c14); /* statement */ 
pool.FeeProvider.SetFeeAmount(_price);
        }else { c_0xba3d8062(0x2d7c89542519b66b17892141ecf71e8cbd83f70e434e77a050120748c8229ca4); /* branch */ 
}
    }

    function WithdrawPoolFee(uint256 _poolId)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
    {c_0xba3d8062(0xed37f7bad0e271d8a2e10da36f9867baa6e48404172bded8565f0c829d9bc46f); /* function */ 

c_0xba3d8062(0xb54f715af7fd1c1259e316c35505d6e762b8057b7b41f1486d5c0fd7f0c25cdb); /* line */ 
        c_0xba3d8062(0x45b5a3d00c6d4c7d81418ec38ea663ab11f2722c1bddbe5a406768c447eaaf42); /* statement */ 
FeeBaseHelper PoolFee = RegistrationPools[_poolId].FeeProvider;
c_0xba3d8062(0x3c6b8da41f943d59562950af969736f679d45bc01aa65d1c28e91b29d098fd02); /* line */ 
        c_0xba3d8062(0x95430473c2612c8f4aaa6ee653bbe8581c3aeeb71ccd850b5cdefa6d7d940910); /* statement */ 
PoolFee.WithdrawFee(payable(RegistrationPools[_poolId].Owner));
    }

    function ActivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, false)
    {c_0xba3d8062(0xc6be12b2c871f82a61029334152c8957bdebaf63c053cabcc07c3b2b1ca1a7d7); /* function */ 

c_0xba3d8062(0x3f4bf7e8672750adf86da09cec55dc5640883233f7bd0d5c43150131bf3b02b6); /* line */ 
        c_0xba3d8062(0x02cf4cdfb4e9f700187ecd5d7ecda2f4e1ed8d64e05719afa35468f0b5451f92); /* statement */ 
RegistrationPools[_poolId].IsActive = true;
c_0xba3d8062(0xdd10f70380b17ff2d1e40955ea5c8ed26d3ec98f21ff467433ee480c742dfca4); /* line */ 
        c_0xba3d8062(0xbf40e5d8cf3acc18277b6ea94679961cdd111f0d57020d74139be9e32aa0c0c5); /* statement */ 
emit RegistrationPoolActivated(_poolId);
    }

    function DeactivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, true)
    {c_0xba3d8062(0x417cdb24f8eb702924659f36f7222979ab730e6a311134709b9c6dc093d29d8c); /* function */ 

c_0xba3d8062(0x3763f5082fa21bb65b7e66550485f793927a178ca523189682c1cf7b0bba50bf); /* line */ 
        c_0xba3d8062(0x3b8055f4f98cfd6f4cf63d9d91c21519ff6343878e1b797f44421c0fa1843ca4); /* statement */ 
RegistrationPools[_poolId].IsActive = false;
c_0xba3d8062(0xfbaee06367eaf7db1d8f39f4e72101857fd0c4833615f37706f1a00fa3404d85); /* line */ 
        c_0xba3d8062(0x48e4f2aa7ca40cfe4cc80d7eb1dd1a3f12b97e3ea91cf55332e133a03379b540); /* statement */ 
emit RegistrationPoolDeactivated(_poolId);
    }
}
