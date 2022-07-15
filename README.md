# Registration

[![Build Status](https://app.travis-ci.com/The-Poolz/RegistrationContract.svg?token=j64fMSARWGtzysprUKZK&branch=master)](https://app.travis-ci.com/The-Poolz/RegistrationContract)
[![codecov](https://codecov.io/gh/The-Poolz/RegistrationContract/branch/master/graph/badge.svg?token=Z3HUc9AJRC)](https://codecov.io/gh/The-Poolz/RegistrationContract)
[![CodeFactor](https://www.codefactor.io/repository/github/the-poolz/registrationcontract/badge)](https://www.codefactor.io/repository/github/the-poolz/registrationcontract)

The main idea of the Registration contract is to automatizate SignUpPool registration process.

### Installation

```console
npm install
```

### Testing

```console
truffle run coverage
```

### Deploy

```console
truffle dashboard
```

```console
truffle migrate --network dashboard
```

## How to set a new fee for a new registration pool creation? (only for admin)

You should use the SetFeeAmount() function to set a new creation registration pool fee.

```solidity
    // to set a new fee price
    function SetFeeAmount(uint256 _amount) public;
```

## How to set a new fee token for a new registration pool creation? (only for admin)

You should use the SetFeeToken() function to set a new registration pool fee price.

```solidity
    // to set a new fee price
function SetFeeToken(address _token) public;
```

## How to create a registration pool?

First of all, you should define the info keys, which users will have to fill with values.
In addition, you have to pay a fee, which admin set for creation a new registration pool.
Likewise, you can set a fee for registration a new SignUp by user.
You should use the Register() function to create a new registration pool.

```solidity
    // to create a new SignUp
    function SignUp(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external;
```

## How to set a new fee for SignUp? (only for pool owner)

You should use the SetRegisterFee() function to set a new SignUp fee.
If you want to set a register token fee you need to specify a token address otherwise set it a zero address.

```solidity
    // to set a new SignUp fee
    function SetRegisterFee(
        uint256 _poolId,
        address _token,
        uint256 _price
    ) public;
```

## How can I deactivate registration pool? (only for pool owner)

You should use the DeactivatePool() function to deactivate a registration pool.

```solidity
    // to deactivate registration pool
    function DeactivatePool(uint256 _poolId) external;
```

## How can I activate registration pool? (only for pool owner)

You should use the ActivatePool() function to activate a registration pool.

```solidity
    // to deactivate registration pool
    function ActivatePool(uint256 _poolId) external;
```

## How can I register a new SignUp?

Firstly, you need to specify a pool id and values, that will be filled in to the keys.
Actually, you need to pay a fee, that pool owner defined for a new SignUp.
After that you should use the SignUp() function to register a new SignUp.

```solidity
    // to register a new SignUp
    function SignUp(uint256 _poolId, string[] memory _values) external payable
```

### Flowchart

![176641193-3f94fe05-9158-44d6-9e45-d41ccb2b58d2](https://user-images.githubusercontent.com/45734486/177203947-cf29161c-b766-43b8-a252-3bb2bffed136.jpg)
