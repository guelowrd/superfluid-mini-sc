// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";

import {ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperToken.sol";

import {SuperTokenV1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/SuperTokenV1Library.sol";

contract StreamWatcher {
    using SuperTokenV1Library for ISuperToken;
    address private constant VITALIK_ADDRESS =
        0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
    ISuperToken public token;

    constructor(ISuperToken _token) {
        token = _token;
    }

    function balanceOf(
        address sender
    ) public view returns (uint8 hasActiveStreamToVitalik) {
        int96 flowRate;
        (, flowRate, , ) = token.getFlowInfo(sender, VITALIK_ADDRESS);
        if (flowRate != 0) {
            hasActiveStreamToVitalik = 1;
        } else {
            hasActiveStreamToVitalik = 0;
        }
    }
}
