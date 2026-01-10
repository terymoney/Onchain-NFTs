// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";
import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";
import {RobotSvg2} from "../src/NFTsContracts/RobotSvg2.sol";

contract RobotSvgsStoreMoreCoverageTest is Test {
    RobotSvgsStore store;

    function setUp() public {
        store = new RobotSvgsStore(); // ✅ 0 args
    }

    function testRegisterOverwritesExistingAddress() public {
        RobotSvg1 svg1 = new RobotSvg1();
        RobotSvg2 svg2 = new RobotSvg2();

        store.registerSvg(0, address(svg1));
        string memory a = store.getSvg(0);

        store.registerSvg(0, address(svg2));
        string memory b = store.getSvg(0);

        assertGt(bytes(a).length, 0);
        assertGt(bytes(b).length, 0);

        // should not be identical svg strings
        assertTrue(keccak256(bytes(a)) != keccak256(bytes(b)));
    }

    function testRegisterThenFetchMultipleIndices() public {
        RobotSvg1 svg1 = new RobotSvg1();
        RobotSvg2 svg2 = new RobotSvg2();

        store.registerSvg(1, address(svg1));
        store.registerSvg(2, address(svg2));

        string memory s1 = store.getSvg(1);
        string memory s2 = store.getSvg(2);

        assertGt(bytes(s1).length, 0);
        assertGt(bytes(s2).length, 0);
        assertTrue(keccak256(bytes(s1)) != keccak256(bytes(s2)));
    }
}
