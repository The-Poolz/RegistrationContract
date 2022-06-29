// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RegistrationData.sol";

/// @title contains all events.
contract RegistrationEvents is RegistrationData {
    event NewRegistrationPoolCreated(
        uint256 PoolId,
        address Owner,
        address TokenFee,
        uint256 Fee
    );
    event RegistrationTokenChanged(
        uint256 PoolId,
        address NewToken,
        address OldToken
    );
    event RegistrationPriceChanged(
        uint256 PoolId,
        uint256 NewPrice,
        uint256 OldPrice
    );
    event NewRegistration(
        Company RegisteredCompany,
        string[] Values,
        uint256 ValuesAmount,
        uint256 CompanyId,
        uint256 Price
    );

    event RegistrationPoolActivated(uint256 PoolId);
    event RegistrationPoolDeactivated(uint256 PoolId);
}
