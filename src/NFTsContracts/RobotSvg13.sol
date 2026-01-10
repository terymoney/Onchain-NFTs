// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg13 is IRobotSvg {
    // 13 — visor robot with angled arm
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<rect x='82' y='28' width='36' height='14' rx='4' fill='#000' opacity='0.9'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "<g transform='translate(142,82) rotate(-35)'>"
        "<rect x='-6' y='0' width='12' height='28' rx='6' fill='#BFE9FF' stroke='#000' stroke-width='3'/>"
        "</g>"
        "<line x1='100' y1='22' x2='100' y2='8' stroke='#000' stroke-width='3'/>"
        "<circle cx='100' cy='6' r='4' fill='#000'/>"
        "<circle cx='100' cy='100' r='6' fill='#FFF' stroke='#000' stroke-width='2'/>"
        "</svg>";

    function getSvgData() external pure returns (string memory) {
        return SVG_DATA;
    }

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special)
    {
        return ("Light Blue", "Visor", "Ready", "Angled Arm");
    }
}
