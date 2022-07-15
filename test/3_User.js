const RegistrationUser = artifacts.require("RegistrationUser");
const FeeBaseHelper = artifacts.require("FeeBaseHelper");
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const TestToken = artifacts.require("ERC20Token");
const BigNumber = require("bignumber.js");
const constants = require('@openzeppelin/test-helpers/src/constants.js');

contract("User actions", accounts => {
    const ownerAddress = accounts[0];
    const user1 = accounts[1];
    const price = '0';
    const feePrice = "5";

    let instance;
    let Token;
    let poolId, poolId2;

    before(async () => {
        instance = await RegistrationUser.new();
        Token = await TestToken.new('TestToken', 'TEST');
        const tx = await instance.Register(constants.ZERO_ADDRESS, price, ["Key1", "Key2", "Key3", "Key4", "Key5"], { from: ownerAddress });
        poolId = tx.logs[1].args.PoolId.toString();
        const tx2 = await instance.Register(constants.ZERO_ADDRESS, feePrice, ["Key1", "Key2", "Key3", "Key4", "Key5"], { from: ownerAddress });
        poolId2 = tx2.logs[1].args.PoolId.toString();
    });

    it('SignUp when fee is zero', async () => {
        const tx = await instance.SignUp(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: user1 });
        truffleAssert.eventEmitted(tx, 'NewRegistration');
    });

    describe('Registering via ETH', () => {
        const fee = web3.utils.toWei('0.001', 'ether');

        before(async () => {
            await instance.SetRegisterFee(poolId, constants.ZERO_ADDRESS, fee, { from: ownerAddress });
        });

        it('should SignUp paying fee in ETH', async () => {
            const tx = await instance.SignUp(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[2], value: fee });
            truffleAssert.eventEmitted(tx, 'NewRegistration');
        });

        it('Fail to SignUp when fee is not provided', async () => {
            const tx = instance.SignUp(poolId2, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[3] });
            await truffleAssert.reverts(tx, 'Not Enough Fee Provided');
        });

        it('Fail to SignUp when pool does not exist', async () => {
            const tx = instance.SignUp(10, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[5], value: '10' });
            truffleAssert.reverts(tx, 'Incorrect pool id.');
        });
    });

    describe('SignUp via ERC20', () => {
        const fee = '1000';
        let poolId3;

        before(async () => {
            const tx = await instance.Register(Token.address, fee, ["Key1", "Key2", "Key3", "Key4", "Key5"], { from: ownerAddress });
            poolId3 = tx.logs[1].args.PoolId.toString();
            await Token.transfer(accounts[3], fee, { from: ownerAddress });
            await Token.approve(instance.address, fee, { from: accounts[3] });
        });

        it('should SignUp paying fee in ERC20', async () => {
            const result = await instance.RegistrationPools(poolId3);
            await Token.transfer(accounts[4], fee, { from: ownerAddress });
            await Token.approve(result['FeeProvider'], fee, { from: accounts[4] });
            const tx = await instance.SignUp(poolId3, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[4] });
            truffleAssert.eventEmitted(tx, 'NewRegistration');
        });

        it('should fail to SignUp when fee is not provided', async () => {
            const tx = instance.SignUp(poolId2, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[4] });
            await truffleAssert.reverts(tx, 'Not Enough Fee Provided'); // revert msg from poolz-helper
        });

        it('should SignUp when fee is 0', async () => {
            await Token.transfer(accounts[6], fee, { from: ownerAddress });
            await Token.approve(instance.address, fee, { from: accounts[6] });
            const tx = await instance.Register(Token.address, 0, ["Key1", "Key2", "Key3", "Key4", "Key5"], { from: ownerAddress });
            const poolId = tx.logs[1].args.PoolId.toString();
            const tx2 = await instance.SignUp(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[6] });
            truffleAssert.eventEmitted(tx2, 'NewRegistration');
        });
    });

    describe('Manipulation with data', () => {
        const fee = '1000';
        const newValuesArray = ["Value5", "Value4", "Value3", "Value2", "Value1"];

        let poolId;

        before(async () => {
            const tx = await instance.Register(constants.ZERO_ADDRESS, fee, ["Key1", "Key2", "Key3", "Key4", "Key5"], { from: ownerAddress });
            poolId = tx.logs[1].args.PoolId.toString();
        });

        it('should change SignUpPool values', async () => {
            const tx2 = await instance.SignUp(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: accounts[2], value: fee });
            const SignUpId = tx2.logs[1].args.SignUpId.toString();
            await instance.EditValues(poolId, SignUpId, newValuesArray, { from: accounts[2] });
            const newValues = await instance.GetValues(poolId, SignUpId);
            assert.equal(newValuesArray.toString(), newValues.toString());
        });

        it('should get all SignUpPool ids of owner', async () => {
            const result = await instance.GetAllMySignUpIds(poolId, { from: accounts[2] });
            assert.equal(result.length, 1);
            assert.equal(result.toString(), [0].toString());
        });

        it('should get all RegistrationPool ids of owner', async () => {
            const result = await instance.GetMyPoolIds({ from: ownerAddress });
            assert.equal(5, result.length);
        });
    });
});