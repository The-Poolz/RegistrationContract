// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
function c_0xba411aa8(bytes32 c__0xba411aa8) pure {}


import "./RegistrationPO.sol";

contract RegistrationUser is RegistrationPO {
function c_0x50bd3fe6(bytes32 c__0x50bd3fe6) internal pure {}

    function Register(uint256 _poolId, string[] memory _values)
        external
        payable
        whenNotPaused
        isCorrectPoolId(_poolId)
        mustHaveElements(_values)
        validateStatus(_poolId, true)
    {c_0x50bd3fe6(0xf465f84decb7d9a13c94946b43611fe9819f805c9970127f323d994ee49726a4); /* function */ 

c_0x50bd3fe6(0xea24ea5dd6033f7883721c824514261798ce595c663cc75a5ffb9a97e44d4a9c); /* line */ 
        c_0x50bd3fe6(0xdd4183cf3f87326bfac817a09e0eeac17aeed2849812134227d873522581468c); /* statement */ 
RegistrationPool storage pool = RegistrationPools[_poolId];
c_0x50bd3fe6(0x764efaf8bbada7e32a7684ff6cd9d5db13461bb80d0c18f68caee2a56555fbac); /* line */ 
        c_0x50bd3fe6(0xc1694ed1583b750c46831a1cf10dc413ed140966e28f1d4ca9525d8ca3d6c068); /* requirePre */ 
c_0x50bd3fe6(0x931d71811c89e5d4fc016d965cced1a1079cc22bce7904e873db86f433dc6f97); /* statement */ 
require(
            pool.Keys.length == _values.length,
            "Values must be the same length as the keys."
        );c_0x50bd3fe6(0xcf4feebefe4eb5a03376000138b303dfe3d81b057231cce7aaa3357287c8db74); /* requirePost */ 

c_0x50bd3fe6(0x9d93292931fc81942dc4f858cc48bf1e6d18432020bf9539efe2a383f05360b0); /* line */ 
        c_0x50bd3fe6(0xee22403749c442a9602397d9c1bc9e9206b743f8ba5ddf54f1bb3316d8fc1306); /* statement */ 
pool.FeeProvider.PayFee{value: msg.value}(pool.FeeProvider.Fee());

c_0x50bd3fe6(0x7bd03eb23b8aa4a88af3486fcdb14bc420d8a38cc19beaabb621246842096c82); /* line */ 
        c_0x50bd3fe6(0xc2092bc545dd8aa8016ec39c56cb55c59e2f1fdfaa12ce7e0356417cbcd077c1); /* statement */ 
uint256 totalCompanies = RegistrationPools[_poolId].TotalCompanies;
c_0x50bd3fe6(0x12e2cef2ea1b5fec5466f2e27b3530915c6a3f1debe9d258859112e7aba7344e); /* line */ 
        c_0x50bd3fe6(0xd1780128b8cd18c1576659ee2201c2a4c109235b14e534ecb4e3be7eb80da8cb); /* statement */ 
Companies[totalCompanies] = Company(_poolId, totalCompanies, _values);
c_0x50bd3fe6(0xa7e63b6f5fceb6d5824c2ad27ff4dc9bc06f780cf086cabaa654808546f6a9a8); /* line */ 
        c_0x50bd3fe6(0xcd96305e66309c477851d9e6c8bb6c692fbc47bb992191095314ed14a16bdfd2); /* statement */ 
pool.CompaniesId.push(totalCompanies);

c_0x50bd3fe6(0xb310567fdeb26a154c838fdf6283e1408b9c81edbe9435e6a81970f76dd7107c); /* line */ 
        c_0x50bd3fe6(0xd15c73f29b54940ad76b0c1dced6983a111558d7b989b31825d0fd4e648aa20a); /* statement */ 
emit NewRegistration(
            RegistrationPools[_poolId].TotalCompanies,
            _values
        );
c_0x50bd3fe6(0xaaf3827974adf4660ee9ef492d7f2061f69e571a68337d29979feb4d826ec77c); /* line */ 
        RegistrationPools[_poolId].TotalCompanies++;
    }
}
