// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";

import {ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperToken.sol";

import {SuperTokenV1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/SuperTokenV1Library.sol";

contract VitalikStreamWatcher {
    using SuperTokenV1Library for ISuperToken;
    address private immutable i_vitalik_address;
    ISuperToken public token;

    constructor(address _superTokenAddress, address _vitalikAddress) {
        token = ISuperToken(_superTokenAddress);
        i_vitalik_address = _vitalikAddress;
    }

    function balanceOf(
        address sender
    ) public view returns (uint8 hasActiveStreamToVitalik) {
        int96 flowRate;
        (, flowRate, , ) = token.getFlowInfo(sender, i_vitalik_address);
        if (flowRate != 0) {
            hasActiveStreamToVitalik = 1;
        } else {
            hasActiveStreamToVitalik = 0;
        }
    }
}
