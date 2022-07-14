// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "poolz-helper-v2/contracts/FeeBaseHelper.sol";

contract RegistrationData {
    mapping(uint256 => RegistrationPool) public RegistrationPools;
    uint256 public TotalPools;

    struct RegistrationPool {
        address Owner;
        string[] Keys;
        bool IsActive;
        FeeBaseHelper FeeProvider;
        uint256 UserSignUps;
        uint256 TotalKeys;
        mapping(uint256 => SignUpPool) SignUpPools;
    }

    struct SignUpPool {
        address Owner;
        uint256 PoolId;
        uint256 SignUpId;
        string[] Values;
    }

    function _getOwners(uint256 _amount, int256 _poolId)
        internal
        view
        returns (address[] memory)
    {
        address[] memory owners = new address[](_amount);
        for (uint256 i = 0; i < _amount; i++) {
            if (_poolId < 0) {
                owners[i] = RegistrationPools[i].Owner;
            } else {
                owners[i] = RegistrationPools[uint256(_poolId)]
                    .SignUpPools[i]
                    .Owner;
            }
        }

        return owners;
    }

    function _findMatchingValues(uint256 _amount, address[] memory _owners)
        internal
        view
        returns (uint256[] memory)
    {
        uint256 counter = 0;
        for (uint256 i = 0; i < _amount; i++) {
            if (_owners[i] == msg.sender) {
                counter++;
            }
        }

        uint256[] memory res = new uint256[](counter);
        uint256 j = 0;
        for (uint256 i = 0; i < _amount; i++) {
            if (_owners[i] == msg.sender) {
                res[j++] = i;
            }
        }

        return res;
    }
}
