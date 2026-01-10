// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg14 is IRobotSvg {
    // 14 — chef robot with hat
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#FFEFD5' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#FFEFD5' stroke='#000' stroke-width='3'/>"
        "<g transform='translate(100,18)'>"
        "<ellipse cx='0' cy='-6' rx='30' ry='8' fill='#FFF' stroke='#000' stroke-width='2'/>"
        "<rect x='-20' y='-14' width='40' height='12' rx='4' fill='#FFF' stroke='#000' stroke-width='2'/>"
        "</g>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='110' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<path d='M90 46 Q100 52 110 46' stroke='#000' stroke-width='2' fill='none' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#FFEFD5' stroke='#000' stroke-width='3'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#FFEFD5' stroke='#000' stroke-width='3'/>"
        "<line x1='80' y1='100' x2='120' y2='100' stroke='#000' stroke-width='2'/>"
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
        return ("Cream Peach", "Chef Hat", "Helpful", "Chef");
    }
}
