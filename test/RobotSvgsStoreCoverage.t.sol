// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";
import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";

contract RobotSvgsStoreCoverageTest is Test {
    RobotSvgsStore store;

    function setUp() public {
        store = new RobotSvgsStore(); // ✅ your store takes 0 args
    }

    function testGetSvgRevertsWhenNotRegistered() public {
        vm.expectRevert(); // "SVG contract not found"
        store.getSvg(123);
    }

    function testGetSvgRevertsWhenTargetHasNoGetSvgData() public {
        // register an address that does NOT implement getSvgData()
        store.registerSvg(0, address(this));

        vm.expectRevert(); // "Failed to fetch SVG data"
        store.getSvg(0);
    }

    function testGetSvgWorksWhenRegistered() public {
        RobotSvg1 svg1 = new RobotSvg1();
        store.registerSvg(0, address(svg1));

        string memory svg = store.getSvg(0);
        assertGt(bytes(svg).length, 0);
    }
}
