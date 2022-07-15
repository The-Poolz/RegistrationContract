# Registration

[![Build Status](https://app.travis-ci.com/The-Poolz/RegistrationContract.svg?token=j64fMSARWGtzysprUKZK&branch=master)](https://app.travis-ci.com/The-Poolz/RegistrationContract)
[![codecov](https://codecov.io/gh/The-Poolz/RegistrationContract/branch/master/graph/badge.svg?token=Z3HUc9AJRC)](https://codecov.io/gh/The-Poolz/RegistrationContract)
[![CodeFactor](https://www.codefactor.io/repository/github/the-poolz/registrationcontract/badge)](https://www.codefactor.io/repository/github/the-poolz/registrationcontract)

The main idea of the Registration contract is to automatizate SignUpPool registration process.

### Navigation

- [Installation](#installation)
- [Admin](#admin-settings)
- [Pool owner](#pool-owner-settings)
- [User](#user-settings)
- [License](#license)

#### Installation

```console
npm install
```

#### Testing

```console
truffle run coverage
```

#### Deploy

```console
truffle dashboard
```

```console
truffle migrate --network dashboard
```

## Admin settings

### Setting a new fee amount for registering pool

<pre><b>ATTENTION!
You can set a new fee amount only if it is not equal to previous.</b></pre>

If you want to set a new fee amount for registering a new poo, you should use a SetFeeAmout() function.

```solidity
    // to set a new fee price
    function SetFeeAmount(uint256 _amount) public;
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0xc23988f49603d509593b018ecc3e89a9f33bebdb9454a715905ad4408a058839)

### Setting a new fee token for registering pool

<pre><b>ATTENTION!
You can set a new fee token only if it is not equal to previous.</b></pre>

If you want to set a new fee for registering a new pool as a token, you should use a SetFeeToken() function.

```solidity
    // to set a new fee price
function SetFeeToken(address _token) public;
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0x432e2d652d55e27b6612e368f287fa9c30b5d24632a07ab52f22bf143f0cd746)

## Pool owner settings
### Registering a new pool

First of all, you should define the info keys, which users will have to fill with values.
In addition, you have to pay a fee, which admin set for creation a new registration pool.
Likewise, you can set a fee for registering a new SignUp by user.
You should use the Register() function to create a new registration pool.

<pre><b>ATTENTION!
Token can be null if you want to set a commission for signing up with main coin.</b></pre>

```solidity
    // to create a new registration pool
    function Register(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external payable
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0x1423eed0585bd997529a4d7dc18f4274d2402c5e605155b7d4e7a1d72315a257)

### Setting a register fee

You should use the SetRegisterFee() function to set a new SignUp fee.
If you want to set a register fee token you need to specify a token address otherwise set it a zero address.

```solidity
    // to set a new SignUp fee
    function SetRegisterFee(
        uint256 _poolId,
        address _token,
        uint256 _price
    ) public;
```

### Deactivating a poo

<pre><b>ATTENTION!
You can deactivate a pool only if it is activated.</b></pre>

If you deactivate a pool, users won't be able to sign up.
To do this, you should use a DeactivatePool() function.

```solidity
    // to deactivate registration pool
    function DeactivatePool(uint256 _poolId) external;
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0xd06134ea0721086b57f2a6860f1720f39fe5f08c200ddbb4cae56fc56bd99c26)

### Activating a pool

<pre><b>ATTENTION!
You can activate a pool only if it is deactivated.</b></pre>

If you activate a pool, users will be able to sign up again.
To do this, you should use a ActivatePool() function.

```solidity
    // to deactivate registration pool
    function ActivatePool(uint256 _poolId) external;
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0x06d54e0a57726838da8c34fdda0fbdb13d482c97b37a807ec4bbad9a8fccd09c)

## User settings
### Signing up

Firstly, you need to specify a pool id and values, that will be filled in to the keys.
Actually, you need to pay a fee, that pool owner defined for a new SignUp.
After that you should use the SignUp() function to register a new SignUp.

```solidity
    // to register a new SignUp
    function SignUp(uint256 _poolId, string[] memory _values) external payable;
```

Testnet tx: [link](https://testnet.bscscan.com/tx/0x54f47786639c2747ec3340f94a40f044259370cb8f6a8b10509ac1f57b989c0d)

### Getting my pools' ids
Find all of your pool IDs.

```solidity
    // to get all owner's pool ids
    function GetMyPoolIds() external view returns (uint256[] memory);
```

### Getting my SignUps' ids
Find all of your SignUp IDs.

```solidity
    // to get all user's SignUp ids
    function GetAllMySignUpIds(uint256 _poolId)
        external
        view
        returns (uint256[] memory);
```

## License
The-Poolz Contracts is released under the MIT License.

### Flowchart

![176641193-3f94fe05-9158-44d6-9e45-d41ccb2b58d2](https://user-images.githubusercontent.com/45734486/177203947-cf29161c-b766-43b8-a252-3bb2bffed136.jpg)
