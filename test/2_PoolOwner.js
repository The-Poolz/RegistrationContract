const RegistrationUser = artifacts.require("RegistrationUser");
const { assert } = require('chai');
const truffleAssert = require('truffle-assertions');
const TestToken = artifacts.require("ERC20Token");
const constants = require('@openzeppelin/test-helpers/src/constants.js');
const BigNumber = require('bignumber.js');

contract("Admin settings", accounts => {
    const price = '100';
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
        it('should deactivate existing pool', async () => {
            const tx = await instance.DeactivatePool(poolId, { from: ownerAddress });
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[0].event, 'RegistrationPoolDeactivated');
            assert.equal(result['IsActive'], false);
        });

        it('should fail to deactivate when already is deactivated', async () => {
            const tx = instance.DeactivatePool(poolId, { from: ownerAddress });
            await truffleAssert.reverts(tx, "Pool already has the same status.");
        });

        it('should activate existing pool', async () => {
            const tx = await instance.ActivatePool(poolId, { from: ownerAddress });
            const result = await instance.RegistrationPools(poolId);
            assert.equal(tx.logs[0].event, 'RegistrationPoolActivated');
            assert.equal(result['IsActive'], true);
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

        });

        it('should withdraw pool fee to pool owner when it is ERC20', async () => {

        });
    })
});