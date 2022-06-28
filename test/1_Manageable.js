const RegistrationUser = artifacts.require("RegistrationUser");
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const TestToken = artifacts.require("ERC20Token");
const FeeBaseHelper = artifacts.require("FeeBaseHelper");
const constants = require('@openzeppelin/test-helpers/src/constants.js');
const BigNumber = require('bignumber.js');

contract("Admin settings", accounts => {
    let ownerAddress = accounts[0];
    let instance;
    let Token;
    let feeBase;

    before(async () => {
        instance = await RegistrationUser.new();
        const feeBaseAddr = await instance.BaseFee();
        feeBase = await FeeBaseHelper.at(feeBaseAddr);
        Token = await TestToken.new('TestToken', 'TEST');
    });

    describe('Setting pool creation fee', async () => {
        it('should set ETH Fee', async () => {
            const fee = web3.utils.toWei('0.01', 'ether');
            await instance.SetPoolCreationPrice(fee, { from: ownerAddress });
            const actualFee = await feeBase.Fee();
            const feeToken = await feeBase.FeeToken();
            assert.equal(actualFee, fee);
            assert.equal(feeToken, constants.ZERO_ADDRESS);
        });

        it('should set/get FeeTokenAddress', async () => {
            const fee = '10000';
            await instance.SetPoolCreationPrice(fee, { from: ownerAddress });
            await instance.SetTokenPoolCreation(Token.address, { from: ownerAddress });
            const actualFee = await feeBase.Fee();
            const feeToken = await feeBase.FeeToken();
            assert.equal(feeToken, Token.address);
            assert.equal(actualFee, fee);
        });
    });
});