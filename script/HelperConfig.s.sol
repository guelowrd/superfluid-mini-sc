// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address superTokenAddress;
        address recipientAddress;
    }

    constructor() {
        if (block.chainid == 80001) {
            activeNetworkConfig = getMumbaiConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilConfig();
        }
    }

    function getMumbaiConfig()
        public
        pure
        returns (NetworkConfig memory mumbaiNetworkConfig)
    {
        mumbaiNetworkConfig = NetworkConfig({
            superTokenAddress: 0x0A9ee01dCd8fe9AD5A45584c3Fbbae9ECF8dA1FA,
            recipientAddress: 0x2dFf5e6EAE8B5ec3E44373247AFFC2b1bb977Ae9
        });
    }

    function getOrCreateAnvilConfig()
        public
        pure
        returns (NetworkConfig memory anvilNetworkConfig)
    {
        anvilNetworkConfig = NetworkConfig({
            superTokenAddress: 0x0A9ee01dCd8fe9AD5A45584c3Fbbae9ECF8dA1FA,
            recipientAddress: 0x2dFf5e6EAE8B5ec3E44373247AFFC2b1bb977Ae9
        });
    }
}
