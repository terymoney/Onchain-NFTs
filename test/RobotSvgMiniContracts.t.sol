// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
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

contract RobotSvgMiniContractsTest is Test {
    function testAllMiniContractsExposeSvgAndTraits() public {
        _check(address(new RobotSvg1()));
        _check(address(new RobotSvg2()));
        _check(address(new RobotSvg3()));
        _check(address(new RobotSvg4()));
        _check(address(new RobotSvg5()));
        _check(address(new RobotSvg6()));
        _check(address(new RobotSvg7()));
        _check(address(new RobotSvg8()));
        _check(address(new RobotSvg9()));
        _check(address(new RobotSvg10()));
        _check(address(new RobotSvg11()));
        _check(address(new RobotSvg12()));
        _check(address(new RobotSvg13()));
        _check(address(new RobotSvg14()));
        _check(address(new RobotSvg15()));
    }

    function _check(address c) internal {
        (bool okSvg, bytes memory dataSvg) = c.staticcall(abi.encodeWithSignature("getSvgData()"));
        assertTrue(okSvg);
        string memory svg = abi.decode(dataSvg, (string));
        assertGt(bytes(svg).length, 0);

        (bool okTraits, bytes memory dataTraits) = c.staticcall(abi.encodeWithSignature("getTraits()"));
        assertTrue(okTraits);
        (string memory color, string memory accessory, string memory mood, string memory special) =
            abi.decode(dataTraits, (string, string, string, string));

        assertGt(bytes(color).length, 0);
        assertGt(bytes(accessory).length, 0);
        assertGt(bytes(mood).length, 0);
        assertGt(bytes(special).length, 0);
    }
}
