// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IRobotSvg {
    function getSvgData() external pure returns (string memory);

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special);
}
