// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg12 is IRobotSvg {
    // 12 — beige robot with full dark shades
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#FFF3E0' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#FFF3E0' stroke='#000' stroke-width='3'/>"
        "<rect x='76' y='30' width='48' height='12' rx='4' fill='#000'/>"
        "<circle cx='88' cy='36' r='1.2' fill='#FFF'/>"
        "<circle cx='112' cy='36' r='1.2' fill='#FFF'/>"
        "<line x1='92' y1='46' x2='108' y2='46' stroke='#000' stroke-width='2' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#FFF3E0' stroke='#000' stroke-width='3'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#FFF3E0' stroke='#000' stroke-width='3'/>"
        "<rect x='90' y='92' width='20' height='12' rx='3' fill='#FFF' stroke='#000' stroke-width='1.2'/>"
        "<line x1='100' y1='22' x2='100' y2='8' stroke='#000' stroke-width='3'/>"
        "<circle cx='100' cy='6' r='4' fill='#000'/>"
        "</svg>";

    function getSvgData() external pure returns (string memory) {
        return SVG_DATA;
    }

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special)
    {
        return ("Cream", "Dark Shades", "Chill", "Minimalist");
    }
}
