// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";

import {RobotNft} from "../src/RobotNft.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";

import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";
import {RobotSvg2} from "../src/NFTsContracts/RobotSvg2.sol";
import {RobotSvg3} from "../src/NFTsContracts/RobotSvg3.sol";
import {RobotSvg4} from "../src/NFTsContracts/RobotSvg4.sol";
import {RobotSvg5} from "../src/NFTsContracts/RobotSvg5.sol";
import {RobotSvg6} from "../src/NFTsContracts/RobotSvg6.sol";
import {RobotSvg7} from "../src/NFTsContracts/RobotSvg7.sol";
import {RobotSvg8} from "../src/NFTsContracts/RobotSvg8.sol";
import {RobotSvg9} from "../src/NFTsContracts/RobotSvg9.sol";
import {RobotSvg10} from "../src/NFTsContracts/RobotSvg10.sol";
import {RobotSvg11} from "../src/NFTsContracts/RobotSvg11.sol";
import {RobotSvg12} from "../src/NFTsContracts/RobotSvg12.sol";
import {RobotSvg13} from "../src/NFTsContracts/RobotSvg13.sol";
import {RobotSvg14} from "../src/NFTsContracts/RobotSvg14.sol";
import {RobotSvg15} from "../src/NFTsContracts/RobotSvg15.sol";

contract RobotNftTest is Test {
    string constant NFT_NAME = "RobotNFT";
    string constant NFT_SYMBOL = "RNFT";

    RobotNft public robotNft;
    RobotSvgsStore public store;

    address public constant OWNER = address(100);
    address public constant USER = address(1);

    function setUp() public {
        vm.startPrank(OWNER);

        store = new RobotSvgsStore();

        RobotSvg1 svg1 = new RobotSvg1();
        RobotSvg2 svg2 = new RobotSvg2();
        RobotSvg3 svg3 = new RobotSvg3();
        RobotSvg4 svg4 = new RobotSvg4();
        RobotSvg5 svg5 = new RobotSvg5();
        RobotSvg6 svg6 = new RobotSvg6();
        RobotSvg7 svg7 = new RobotSvg7();
        RobotSvg8 svg8 = new RobotSvg8();
        RobotSvg9 svg9 = new RobotSvg9();
        RobotSvg10 svg10 = new RobotSvg10();
        RobotSvg11 svg11 = new RobotSvg11();
        RobotSvg12 svg12 = new RobotSvg12();
        RobotSvg13 svg13 = new RobotSvg13();
        RobotSvg14 svg14 = new RobotSvg14();
        RobotSvg15 svg15 = new RobotSvg15();

        store.registerSvg(0, address(svg1));
        store.registerSvg(1, address(svg2));
        store.registerSvg(2, address(svg3));
        store.registerSvg(3, address(svg4));
        store.registerSvg(4, address(svg5));
        store.registerSvg(5, address(svg6));
        store.registerSvg(6, address(svg7));
        store.registerSvg(7, address(svg8));
        store.registerSvg(8, address(svg9));
        store.registerSvg(9, address(svg10));
        store.registerSvg(10, address(svg11));
        store.registerSvg(11, address(svg12));
        store.registerSvg(12, address(svg13));
        store.registerSvg(13, address(svg14));
        store.registerSvg(14, address(svg15));

        robotNft = new RobotNft(address(store));

        vm.stopPrank();
    }

    function testInitializedCorrectly() public view {
        assertEq(robotNft.name(), NFT_NAME);
        assertEq(robotNft.symbol(), NFT_SYMBOL);
    }

    function testOnlyOwnerCanMint() public {
        vm.prank(USER);
        vm.expectRevert();
        robotNft.mint(USER, 1, 0);
    }

    function testOwnerCanMintAndBalanceUpdates() public {
        vm.prank(OWNER);
        robotNft.mint(USER, 1, 0);

        assertEq(robotNft.balanceOf(USER), 1);
        assertEq(robotNft.ownerOf(1), USER);
        assertEq(robotNft.tokenToSvgIndex(1), 0);
    }

    function testTokenURIHasCorrectPrefix() public {
        vm.prank(OWNER);
        robotNft.mint(USER, 1, 0);

        string memory tokenUri = robotNft.tokenURI(1);
        assertTrue(_startsWith(tokenUri, "data:application/json;base64,"));
    }

    function testTokenUriRevertsForNonExistentToken() public {
        vm.expectRevert();
        robotNft.tokenURI(999);
    }

    function testAllSvgsAccessibleViaStore() public view {
        for (uint256 i = 0; i < 15; i++) {
            string memory svg = store.getSvg(i);
            assertTrue(bytes(svg).length > 0);
        }
    }

    function _startsWith(string memory full, string memory prefix) internal pure returns (bool) {
        bytes memory fullBytes = bytes(full);
        bytes memory prefixBytes = bytes(prefix);
        if (prefixBytes.length > fullBytes.length) return false;

        for (uint256 i = 0; i < prefixBytes.length; i++) {
            if (fullBytes[i] != prefixBytes[i]) return false;
        }
        return true;
    }
}
