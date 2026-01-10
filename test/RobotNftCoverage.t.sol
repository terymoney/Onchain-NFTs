// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {RobotNft} from "../src/RobotNft.sol";
import {RobotSvgsStore} from "../src/RobotSvgsStore.sol";
import {RobotSvg1} from "../src/NFTsContracts/RobotSvg1.sol";

contract RobotNftCoverageTest is Test {
    RobotNft nft;
    RobotSvgsStore store;

    address user = address(1);

    function setUp() public {
        store = new RobotSvgsStore();            // ✅ 0 args
        nft = new RobotNft(address(store));      // ✅ 1 arg: svg store

        // Register one valid SVG contract at index 0
        RobotSvg1 svg1 = new RobotSvg1();
        store.registerSvg(0, address(svg1));
    }

    function testTokenUriRevertsIfTokenNotMinted() public {
        vm.expectRevert(); // OZ ERC721 reverts on non-existent token
        nft.tokenURI(0);
    }

    function testMintRevertsIfNonOwner() public {
        vm.prank(user);
        vm.expectRevert(); // Ownable revert
        nft.mint(user, 0, 0);
    }

    function testOwnerCanMintThenTokenUriWorks() public {
        // owner is address(this) in tests
        nft.mint(user, 0, 0);

        string memory uri = nft.tokenURI(0);
        assertGt(bytes(uri).length, 0);
    }

    function testTokenUriRevertsIfSvgIndexNotRegistered() public {
        // Mint token with an svgIndex that doesn't exist in store
        nft.mint(user, 1, 999);

        vm.expectRevert(); // store.getSvg will revert "SVG contract not found"
        nft.tokenURI(1);
    }
}
