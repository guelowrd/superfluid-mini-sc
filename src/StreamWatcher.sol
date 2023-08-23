// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

// import {ISuperfluid} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";

import {ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperToken.sol";

import {SuperTokenV1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/SuperTokenV1Library.sol";

contract StreamWatcher {
    using SuperTokenV1Library for ISuperToken;
    address private immutable i_recipient_address;
    ISuperToken public token;

    constructor(address _superTokenAddress, address _recipientAddress) {
        token = ISuperToken(_superTokenAddress);
        i_recipient_address = _recipientAddress;
    }

    function balanceOf(
        address sender
    ) public view returns (uint8 hasActiveStreamToRecipient) {
        int96 flowRate;
        (, flowRate, , ) = token.getFlowInfo(sender, i_recipient_address);
        if (flowRate != 0) {
            hasActiveStreamToRecipient = 1;
        } else {
            hasActiveStreamToRecipient = 0;
        }
    }
}
