const RegistrationUser = artifacts.require("RegistrationUser");
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const TestToken = artifacts.require("ERC20Token");
const constants = require('@openzeppelin/test-helpers/src/constants.js');
const BigNumber = require('bignumber.js');

contract("Admin settings", accounts => {
    let ownerAddress = accounts[0];
    let instance;
    let Token;

    before(async () => {
        instance = await RegistrationUser.new();
        Token = await TestToken.new('TestToken', 'TEST');
    });

    describe('Getting values', async () => {
        before(async () => {
            const tx = await instance.CreateNewRegistrationPool(constants.ZERO_ADDRESS, ["Key1", "Key2", "Key3", "Key4", "Key5"], 100, { from: ownerAddress });
            poolId = tx.logs[1].args.PoolId.toString();
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[1].event, 'NewRegistrationPoolCreated');
            assert.equal(result['IsActive'], true);

            const tx2 = await instance.Register(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[2], value: 100 });
            truffleAssert.eventEmitted(tx2, 'NewRegistration');
        });

        it('should get pool keys', async () => {
            const keysAmount = await instance.GetKeys(poolId);
            const result = await instance.RegistrationPools(poolId);
            assert.equal(result['TotalKeys'], keysAmount.length);
        });

        it('should get company values', async () => {
            const companiesAmount = await instance.TotalCompanies();
            const valuesAmount = await instance.GetValues(companiesAmount - 1);
            const result = await instance.Companies(companiesAmount - 1);
            assert.equal(result['TotalValues'], valuesAmount.length);
        });
    });
});