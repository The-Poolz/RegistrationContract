const RegistrationUser = artifacts.require("RegistrationUser");
const { assert } = require('chai');
const TestToken = artifacts.require("ERC20Token");
const constants = require('@openzeppelin/test-helpers/src/constants.js');

contract("Admin settings", accounts => {
    let ownerAddress = accounts[0];
    let instance;
    let Token;

    before(async () => {
        instance = await RegistrationUser.new();
        Token = await TestToken.new('TestToken', 'TEST');
    });

    describe('Setting pool creation fee', async () => {
        it('should set ETH Fee', async () => {
            const fee = web3.utils.toWei('0.01', 'ether');
            await instance.SetFeeAmount(fee, { from: ownerAddress });
            const actualFee = await instance.Fee();
            const feeToken = await instance.FeeToken();
            assert.equal(actualFee, fee);
            assert.equal(feeToken, constants.ZERO_ADDRESS);
        });

        it('should set/get FeeTokenAddress', async () => {
            const fee = '10000';
            await instance.SetFeeAmount(fee, { from: ownerAddress });
            await instance.SetFeeToken(Token.address, { from: ownerAddress });
            const actualFee = await instance.Fee();
            const feeToken = await instance.FeeToken();
            assert.equal(feeToken, Token.address);
            assert.equal(actualFee, fee);
        });
    });

    describe('Pausing contracts', async () => {
        it('should pause the contract', async () => {
            await instance.Pause();
            assert.equal(await instance.paused(), true);
        });

        it('should unpause the contract', async () => {
            await instance.Unpause();
            assert.equal(await instance.paused(), false);
        });
    });
});