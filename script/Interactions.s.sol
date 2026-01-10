// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {RobotNft} from "../src/RobotNft.sol";

/// @title MintRobotNft
/// @author Maria Terese Ezeobi
/// @notice Mints 15 robots: tokenIds 1..15 and svgIndex 0..14
contract MintRobotNft is Script {
    function run() external {
        address robotNftAddr =
            DevOpsTools.get_most_recent_deployment("RobotNft", block.chainid);

        vm.startBroadcast();

        address to = msg.sender;
        RobotNft nft = RobotNft(robotNftAddr);

        for (uint256 i = 0; i < 15; i++) {
            uint256 tokenId = i + 1;
            uint256 svgIndex = i;
            nft.mint(to, tokenId, svgIndex);
        }

        vm.stopBroadcast();
    }
}
