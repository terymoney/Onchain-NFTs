// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg4 is IRobotSvg {
    // 04 — peach robot, angled head, screen chest
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#FFE9C9' stroke='#000' stroke-width='3'/>"
        "<g transform='translate(100,42) rotate(-8) translate(-100,-42)'>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#FFE9C9' stroke='#000' stroke-width='3'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='110' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<line x1='110' y1='26' x2='116' y2='24' stroke='#000' stroke-width='2'/>"
        "<line x1='92' y1='46' x2='108' y2='46' stroke='#000' stroke-width='2'/>"
        "</g>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#FFE9C9' stroke='#000' stroke-width='3'/>"
        "<rect x='144' y='86' width='12' height='44' rx='6' fill='#FFE9C9' stroke='#000' stroke-width='3'/>"
        "<line x1='100' y1='22' x2='100' y2='8' stroke='#000' stroke-width='3'/>"
        "<circle cx='100' cy='6' r='4' fill='#000'/>"
        "<rect x='85' y='84' width='30' height='18' rx='4' fill='#FFF' stroke='#000' stroke-width='2'/>"
        "</svg>";

    function getSvgData() external pure returns (string memory) {
        return SVG_DATA;
    }

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special)
    {
        return ("Peach", "Screen Chest", "Focused", "None");
    }
}
