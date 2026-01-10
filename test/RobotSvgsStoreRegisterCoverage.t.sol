// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";
import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";

contract RobotSvgsStoreRegisterCoverageTest is Test {
    RobotSvgsStore store;

    function setUp() public {
        store = new RobotSvgsStore();
    }

    function testRegisterSvgRevertsOnZeroAddress() public {
        vm.expectRevert(RobotSvgsStore.RobotSvgsStore__ZeroAddress.selector);
        store.registerSvg(0, address(0));
    }

    function testRegisterSvgRevertsWhenNotAContract() public {
        // any EOA-style address has code.length == 0
        address notAContract = address(123);

        vm.expectRevert(
            abi.encodeWithSelector(RobotSvgsStore.RobotSvgsStore__NotAContract.selector, notAContract)
        );
        store.registerSvg(0, notAContract);
    }

    function testGetSvgContractReturnsRegisteredAddress() public {
        RobotSvg1 svg1 = new RobotSvg1();

        store.registerSvg(7, address(svg1));

        // ✅ covers getSvgContract() (your missing function coverage)
        address saved = store.getSvgContract(7);
        assertEq(saved, address(svg1));
    }
}
