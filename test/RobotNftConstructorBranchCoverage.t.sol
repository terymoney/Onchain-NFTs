// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotNft} from "../src/RobotNft.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";

contract RobotNftConstructorBranchCoverageTest is Test {
    function testConstructorRevertsWhenStoreIsZero() public {
        vm.expectRevert(RobotNft.RobotNft__ZeroAddress.selector);
        new RobotNft(address(0));
    }

    function testConstructorSucceedsWithValidStore() public {
        RobotSvgsStore store = new RobotSvgsStore();
        RobotNft nft = new RobotNft(address(store));

        // sanity check so it doesn't get optimized away
        assertEq(nft.owner(), address(this));
        assertEq(address(nft.svgStore()), address(store));
    }
}
