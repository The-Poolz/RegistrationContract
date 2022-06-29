const RegistrationUser = artifacts.require("RegistrationUser");
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const TestToken = artifacts.require("ERC20Token");
const constants = require('@openzeppelin/test-helpers/src/constants.js');
const BigNumber = require('bignumber.js');

contract("Admin settings", accounts => {
    const fee = '100';

    let ownerAddress = accounts[0];
    let investor = accounts[2];
    let instance;
    let Token;

    before(async () => {
        instance = await RegistrationUser.new();
        Token = await TestToken.new('TestToken', 'TEST');
    });

    describe('Creating registration pool', async () => {
        it('should create a new registration pool', async () => {
            const tx = await instance.CreateNewRegistrationPool(constants.ZERO_ADDRESS, ["Key1", "Key2", "Key3", "Key4", "Key5"], fee, { from: ownerAddress });
            poolId = tx.logs[1].args.PoolId.toString();
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[1].event, 'NewRegistrationPoolCreated');
            assert.equal(result['IsActive'], true);
        });
    });

    describe('Settings of registration pool', async () => {
        it('should pause existing pool', async () => {
            const tx = await instance.DeactivatePool(poolId, { from: ownerAddress });
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[0].event, 'RegistrationPoolDeactivated');
            assert.equal(result['IsActive'], false);
        });

        it('should fail to deactivate when already is deactivated', async () => {
            const tx = instance.DeactivatePool(poolId, { from: ownerAddress });
            await truffleAssert.reverts(tx, "Pool already has the same status.");
        });

        it('should unpause existing pool', async () => {
            const tx = await instance.ActivatePool(poolId, { from: ownerAddress });
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[0].event, 'RegistrationPoolActivated');
            assert.equal(result['IsActive'], true);
        });

        it('should set register token', async () => {
            const tx = await instance.SetRegisterToken(poolId, Token.address);
            const newToken = tx.logs[0].args.NewToken;
            const oldToken = tx.logs[0].args.OldToken;
            const pid = tx.logs[0].args.PoolId;
            assert.equal(newToken, Token.address);
            assert.equal(poolId, pid);
        });
    });

    describe('Reverting of incorrect calling', async () => {
        it('should fail to activate when already active', async () => {
            const tx = instance.ActivatePool(poolId, { from: ownerAddress });
            await truffleAssert.reverts(tx, "Pool already has the same status.");
        });

        it('should fail to activate pool when it does not exist', async () => {
            const tx = instance.ActivatePool(10, { from: ownerAddress });
            await truffleAssert.reverts(tx, "Incorrect pool id.");
        });

        it('should fail to deactivate pool when it is invalid pool owner', async () => {
            await truffleAssert.reverts(instance.DeactivatePool(poolId, { from: investor }), "You are not an owner of pool.");
        });

        it('should fail to activate pool when it is invalid pool owner', async () => {
            await instance.DeactivatePool(poolId, { from: ownerAddress });
            await truffleAssert.reverts(instance.ActivatePool(poolId, { from: investor }), "You are not an owner of pool.");
        });
    });

    describe('Withdraw Pool Owner Fee', () => {
        const poolOwner = accounts[3];
        it('should withdraw pool fee to pool owner when it is main coin', async () => {
            const fee = new BigNumber(web3.utils.toWei('0.05', 'ether').toString());
            const tx = await instance.CreateNewRegistrationPool(constants.ZERO_ADDRESS, ["Key1", "Key2", "Key3", "Key4", "Key5"], fee, { from: poolOwner });
            poolId = tx.logs[1].args.PoolId.toString();
            await instance.Register(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: investor, value: fee });
            const oldBal = new BigNumber((await web3.eth.getBalance(poolOwner)));
            const txnReceipt = await instance.WithdrawPoolFee(poolId, { from: poolOwner });
            const rcpt = await web3.eth.getTransaction(txnReceipt.tx);
            const gasPrice = rcpt.gasPrice;
            const actualBalance = new BigNumber((await web3.eth.getBalance(poolOwner)));
            const gas = new BigNumber(txnReceipt.receipt.gasUsed * gasPrice);
            const expectedBalance = BigNumber.sum(oldBal, fee).minus(gas);
            assert.equal(actualBalance.toString(), expectedBalance.toString());
        });

        it('should withdraw pool fee to pool owner when it is ERC20', async () => {
            const fee = '100000';
            const tx = await instance.CreateNewRegistrationPool(Token.address, ["Key1", "Key2", "Key3", "Key4", "Key5"], fee, { from: poolOwner });
            poolId = tx.logs[1].args.PoolId.toString();
            const result = await instance.RegistrationPools(poolId);
            const oldBal = await Token.balanceOf(poolOwner);
            await Token.transfer(investor, fee);
            await Token.approve(result['FeeProvider'], fee, { from: investor });
            await instance.Register(poolId, ["Value1", "Value2", "Value3", "Value4", "Value5"], { from: investor });
            await instance.WithdrawPoolFee(poolId, { from: poolOwner });
            const actualBalance = await Token.balanceOf(poolOwner);
            assert.equal(oldBal, '0', 'invalid balance');
            assert.equal(actualBalance, fee, 'invalid balance');
        });
    });
});