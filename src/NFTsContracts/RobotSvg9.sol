// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg9 is IRobotSvg {
    // 09 — explorer robot with backpack
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='46' y='70' width='108' height='68' rx='14' fill='#B0BEC5' stroke='#000' stroke-width='2.5'/>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='110' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<line x1='92' y1='46' x2='108' y2='46' stroke='#000' stroke-width='2' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<line x1='72' y1='70' x2='86' y2='90' stroke='#000' stroke-width='2'/>"
        "<line x1='128' y1='70' x2='114' y2='90' stroke='#000' stroke-width='2'/>"
        "<circle cx='100' cy='104' r='8' fill='#FFF' stroke='#000' stroke-width='1.5'/>"
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
        return ("Light Blue", "Backpack", "Adventurous", "Explorer");
    }
}
