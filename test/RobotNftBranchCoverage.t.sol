// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotNft} from "../src/RobotNft.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";
import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";

contract RobotNftBranchCoverageTest is Test {
    RobotNft nft;
    RobotSvgsStore store;

    address user = address(1);

    function setUp() public {
        store = new RobotSvgsStore();           // ✅ 0 args
        nft = new RobotNft(address(store));     // ✅ 1 arg

        // Register at least 1 svg so mint+tokenURI paths are valid
        RobotSvg1 svg1 = new RobotSvg1();
        store.registerSvg(0, address(svg1));
    }

    function testMintRevertsOnDuplicateTokenId() public {
        nft.mint(user, 0, 0);

        vm.expectRevert(); // ERC721: token already minted
        nft.mint(user, 0, 0);
    }

    function testMintRevertsOnZeroAddressReceiver() public {
        vm.expectRevert(); // ERC721: mint to the zero address
        nft.mint(address(0), 1, 0);
    }
}
