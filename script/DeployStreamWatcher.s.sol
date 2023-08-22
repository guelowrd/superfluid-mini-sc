// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {VitalikStreamWatcher} from "../src/StreamWatcher.sol";

contract DeployStreamWatcher is Script {
    function run() external returns (VitalikStreamWatcher, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        address superTokenAddress;
        address vitalikAddress;
        (superTokenAddress, vitalikAddress) = helperConfig
            .activeNetworkConfig();
        vm.startBroadcast();
        VitalikStreamWatcher streamWatcher = new VitalikStreamWatcher(
            superTokenAddress,
            vitalikAddress
        );
        vm.stopBroadcast();
        return (streamWatcher, helperConfig);
    }
}
