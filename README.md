# Registration
[![Build Status](https://app.travis-ci.com/The-Poolz/RegistrationContract.svg?token=j64fMSARWGtzysprUKZK&branch=master)](https://app.travis-ci.com/The-Poolz/RegistrationContract)
[![codecov](https://codecov.io/gh/The-Poolz/RegistrationContract/branch/master/graph/badge.svg?token=Z3HUc9AJRC)](https://codecov.io/gh/The-Poolz/RegistrationContract)

The main idea of the Registration contract is to automatizate company registration process.

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

## How to create a registration pool?
**1.** First of all, you should define the info keys, which users will have to fill with values.
       In addition, you have to pay a fee, which admin set for creation a new registration pool.
       Likewise, you can set a fee for registration a new company by user.
   You should use the CreateNewRegistrationPool() function to create a new registration pool.
```solidity
    // to create a new registration pool
    function CreateNewRegistrationPool(
        address _token,
        string[] memory _keys,
        uint256 _fee
    ) external;
```

## How to set a new fee token for company registration?
**2.** You should use the SetRegisterToken() function to set a new register fee token.
```solidity
    // to set a new register fee token
    function SetRegisterToken(uint256 _poolId, address _token) external;
```

## How to set a new fee price for company registration?
**3.** You should use the SetRegisterPrice() function to set a new register fee price.
```solidity
    // to set a new register fee token
    function SetRegisterPrice(uint256 _poolId, uint256 _price) external;
```

![1](https://user-images.githubusercontent.com/45734486/176641193-3f94fe05-9158-44d6-9e45-d41ccb2b58d2.png)


