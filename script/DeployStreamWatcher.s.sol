// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {StreamWatcher} from "../src/StreamWatcher.sol";

contract DeployStreamWatcher is Script {
    function run() external returns (StreamWatcher, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        address superTokenAddress;
        address recipientAddress;
        (superTokenAddress, recipientAddress) = helperConfig
            .activeNetworkConfig();
        vm.startBroadcast();
        StreamWatcher streamWatcher = new StreamWatcher(
            superTokenAddress,
            recipientAddress
        );
        vm.stopBroadcast();
        return (streamWatcher, helperConfig);
    }
}
