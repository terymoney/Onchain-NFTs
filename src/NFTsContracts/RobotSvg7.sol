// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg7 is IRobotSvg {
    // 07 — grayscale robot, winking eye
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#E0E0E0' stroke='#111' stroke-width='2.5'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#E0E0E0' stroke='#111' stroke-width='2.5'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#111'/>"
        "<line x1='112' y1='34' x2='118' y2='34' stroke='#111' stroke-width='3' stroke-linecap='round'/>"
        "<line x1='92' y1='46' x2='108' y2='46' stroke='#111' stroke-width='1.8' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#E0E0E0' stroke='#111' stroke-width='2.5'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#E0E0E0' stroke='#111' stroke-width='2.5'/>"
        "<line x1='80' y1='100' x2='120' y2='100' stroke='#111' stroke-width='1.6'/>"
        "<line x1='100' y1='22' x2='100' y2='8' stroke='#111' stroke-width='2.5'/>"
        "<circle cx='100' cy='6' r='3.5' fill='#111'/>"
        "</svg>";

    function getSvgData() external pure returns (string memory) {
        return SVG_DATA;
    }

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special)
    {
        return ("Gray", "Antenna", "Playful", "Monochrome");
    }
}
