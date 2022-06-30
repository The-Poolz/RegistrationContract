// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0x163ac123(bytes32 c__0x163ac123) pure {}


import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

import "./RegistrationManageable.sol";

contract RegistrationPO is RegistrationManageable {
function c_0x4508b879(bytes32 c__0x4508b879) internal pure {}

    function CreateNewRegistrationPool(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external whenNotPaused mustHaveElements(_keys) {c_0x4508b879(0x073ef97aea88a4e46579fa95d4b03d11fd279b674da2e1db9bd2945a1a633da9); /* function */ 

c_0x4508b879(0x563e0f4daad744f6646e93155285a42638c6aab795239bc7960ece1a419b72cc); /* line */ 
        c_0x4508b879(0xc7a2b9beb45a26968485e1cd634e4f8b768162d54fabc0bcacf67424c4076442); /* statement */ 
PayFee(Fee);
c_0x4508b879(0x83ed3945d6b94d459d3c7785bc22382ad62a4741f4cb607bc15f7c3d5bf66999); /* line */ 
        c_0x4508b879(0x23e73cad2541e41f71f1ee1d2bb1aa36dca5f383ddea146811a474757e3f458f); /* statement */ 
uint256[] memory companyIds;
c_0x4508b879(0xf8c65cda00f9ff29004e2494d137893a07b5cd75bcd90943321c85a2237b356d); /* line */ 
        c_0x4508b879(0x716ec50fdc5cf8588f2c32646396a81d74711a17ddd55f1a7f14d4800626d2f2); /* statement */ 
RegistrationPools[TotalPools] = RegistrationPool(
            msg.sender,
            _keys,
            companyIds,
            true,
            new FeeBaseHelper(),
            0
        );
c_0x4508b879(0x06134ad80095191253ba383a4f3431fd637d765234a70fdf06d8e681ea3562e7); /* line */ 
        c_0x4508b879(0xd71d81535ee403bd7d698e8baaba076ac66f97b5b24e2b2a697ed60b69b9ef73); /* statement */ 
RegistrationPool storage newPool = RegistrationPools[TotalPools];

c_0x4508b879(0x9350f3e3442b7243a88b10386f84d98ac93796ca59b31f4d025fac1fc641777f); /* line */ 
        c_0x4508b879(0xa8c43ec60c478d7d24e87a47aa8598e60053f4c6664a844451a140b22ccdde20); /* statement */ 
if (_token != address(0)) {c_0x4508b879(0x8af51258c51d85de9dc3e7958f1f0af1f994c935ea40dfb5765d7618a615f469); /* branch */ 

c_0x4508b879(0x123ec154b4f1660573dccddabc230397cac0d4aba0a597ef420bb6191271ac4e); /* line */ 
            c_0x4508b879(0x9a9f68076baa5d56922e48d655e921b7a9cdf2717d1eff2d35273d2df7a21e6a); /* statement */ 
newPool.FeeProvider.SetFeeToken(_token);
        }else { c_0x4508b879(0x37df69ed6f228df79eaf64fd8c2c80333467e3c141db6620e64aca0ba0e84dad); /* branch */ 
}
c_0x4508b879(0x8f546241449d5a4d86bc2e9f344378acf8a531a47af988ce4b12f65977d61cf0); /* line */ 
        c_0x4508b879(0xcd78812fac820d41ae97bca76c7fbad801167cedbda85fc391e9669d9f57d239); /* statement */ 
if (_fee != 0) {c_0x4508b879(0x1d64b88aea4d9709ba043592a72371f19f2f47df7e0d6079f268b8b9bacbcd92); /* branch */ 

c_0x4508b879(0x1bff603e669e4c39aa2cf10a17a4ec5df318f159e6b66d7e6233cd01a3733dfa); /* line */ 
            c_0x4508b879(0x9d99369e3e4da995544481254e889a7e91c8ed0d248b92e69d25ff2bd5291585); /* statement */ 
newPool.FeeProvider.SetFeeAmount(_fee);
        }else { c_0x4508b879(0xa499788c243970f51d09bab0faea069c8fa52705eb466b14850795396c7cd1d5); /* branch */ 
}

c_0x4508b879(0x459f417c437aa036a4ca644f06d24ee4dbc5819d32ad58cd0a95f1a6fba7e2f0); /* line */ 
        c_0x4508b879(0x2104d9d7fd40dce2b54e0eb0165d19194b13cffbfc995ba8f9a1c6da59a6b0a7); /* statement */ 
emit NewRegistrationPoolCreated(
            TotalPools,
            _keys,
            newPool.Owner,
            newPool.FeeProvider.FeeToken(),
            newPool.FeeProvider.Fee()
        );
c_0x4508b879(0xacb972db66ba21e7d7a6e0e4ef04e340f8ee884456c19a1e9faeb797d8342d72); /* line */ 
        TotalPools++;
    }

    function SetRegisterToken(uint256 _poolId, address _token)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {c_0x4508b879(0x74bf9bf74f5f58058dfcc2706999fda271fdc222e434ca0dd77b54385712207b); /* function */ 

c_0x4508b879(0x64fb68c541f943e49d83887140fb5d37385781fb2385a612bf5a110b93d90062); /* line */ 
        c_0x4508b879(0xcee46481522744730ebc8eb5f5b2bda63385c880bd5d867c3970bca37530b23c); /* statement */ 
RegistrationPool storage pool = RegistrationPools[_poolId];
c_0x4508b879(0xd2d60965dd8070a5251f61d1e202432b89a9c1f22add6259a6ee08714f207eb4); /* line */ 
        c_0x4508b879(0x251e8a11e81626a970f0ac94840d507f918a87abdfbf07d0864c6f70ee42c47e); /* statement */ 
pool.FeeProvider.SetFeeToken(_token);
    }

    function SetRegisterPrice(uint256 _poolId, uint256 _price)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
        isCorrectPoolId(_poolId)
    {c_0x4508b879(0xec4c33dfdfdf28c534bb898e7ccc40f4c35035deb764cdd5dfa52f5d42e92819); /* function */ 

c_0x4508b879(0x232f554a0282ab03f0cb66e65574a1ceba7a8d4ad0c13770d3472f856aec32f7); /* line */ 
        c_0x4508b879(0xf47de350199b8fca9132171efd07737422199399a1de49bfbe3139f93d58c9a9); /* statement */ 
RegistrationPool storage pool = RegistrationPools[_poolId];
c_0x4508b879(0xbd0d3f6b06d8234c8cbd826e427e582d61b92134cece818b6cd687b20bc10ac4); /* line */ 
        c_0x4508b879(0x589bc4b5aa11ab2cc3a1af3231832d07267d5b900b1a36ac139949d1310e262c); /* statement */ 
pool.FeeProvider.SetFeeAmount(_price);
    }

    function WithdrawPoolFee(uint256 _poolId)
        external
        whenNotPaused
        onlyPoolOwner(_poolId)
    {c_0x4508b879(0x08927b9ce46d6cf1b134481f385f9f7d0de0eca94302bec5fd73519120b388ac); /* function */ 

c_0x4508b879(0x509dac4e6c8d9694475f14c635c83e3970981de59d67d5525a959b64ae1799ff); /* line */ 
        c_0x4508b879(0xeabf55faf01b899b0ce17b80ad3772e25835b704e706fabfa154601205f451fa); /* statement */ 
FeeBaseHelper PoolFee = RegistrationPools[_poolId].FeeProvider;
c_0x4508b879(0xabf6e998e14ab19d939c9cd68d04304ff6aa8cc7780c7b46beab465bfac7e0ff); /* line */ 
        c_0x4508b879(0x91d04ff4f4a50b7df29dd312018bd118632c912a0e369feb31ef97a49d062228); /* statement */ 
PoolFee.WithdrawFee(payable(RegistrationPools[_poolId].Owner));
    }

    function ActivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, false)
    {c_0x4508b879(0x55a8312e10a7c1ff6a74493ae18781c32fa41bf12beef50568982c3d188694f0); /* function */ 

c_0x4508b879(0x020b6728dab8fea341dc58a7795d4dad36604f1754acda24d9a24e50ed5da262); /* line */ 
        c_0x4508b879(0x8b7391fc97a37c981ae338b8bce053ef8fb1af2f5e98caf9071f347c9b57865a); /* statement */ 
RegistrationPools[_poolId].IsActive = true;
c_0x4508b879(0x3f11ef334191aa89720afa545024f72f955c5389e136be262ac19d12fc835edf); /* line */ 
        c_0x4508b879(0x859645a2e4fe514e2877561ee65f7032aa212f8ed39ef501cb34019db2014e03); /* statement */ 
emit RegistrationPoolActivated(_poolId);
    }

    function DeactivatePool(uint256 _poolId)
        external
        whenNotPaused
        isCorrectPoolId(_poolId)
        onlyPoolOwner(_poolId)
        validateStatus(_poolId, true)
    {c_0x4508b879(0x575e724a99083e0c636385f1cda8e1ec8c6c1b82da525dd131b5f80996021483); /* function */ 

c_0x4508b879(0xecfb8f0a003b9576480ade92ae4e43bce5c53f4dd98d2ed105fef6bf716b3d1d); /* line */ 
        c_0x4508b879(0x9ad25331c1f92a0804530ac77d3ac57568f5404294b9f5ad5d6a0077b2eab34f); /* statement */ 
RegistrationPools[_poolId].IsActive = false;
c_0x4508b879(0x0b7b0f191151e0998c0035d3930a5b3630071c6059f93706497483b04c511116); /* line */ 
        c_0x4508b879(0x225373ab423c52e0b84895835f3d19b68bc4cea9c5795412cca5fcf983c53f55); /* statement */ 
emit RegistrationPoolDeactivated(_poolId);
    }
}
