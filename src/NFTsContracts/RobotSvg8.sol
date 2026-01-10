// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg8 is IRobotSvg {
    // 08 — pink robot celebrating, arms raised
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#FFCDD2' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#FFCDD2' stroke='#000' stroke-width='3'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='110' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='87' y='44' width='26' height='10' rx='3' fill='#000'/>"
        "<g transform='translate(48,86) rotate(56)'><rect x='0' y='-4' width='12' height='40' rx='6' fill='#FFCDD2' stroke='#000' stroke-width='3'/></g>"
        "<g transform='translate(140,86) rotate(-56)'><rect x='0' y='-4' width='12' height='40' rx='6' fill='#FFCDD2' stroke='#000' stroke-width='3'/></g>"
        "<line x1='100' y1='22' x2='100' y2='8' stroke='#000' stroke-width='3'/>"
        "<circle cx='100' cy='6' r='4' fill='#000'/>"
        "<circle cx='88' cy='100' r='5' fill='#FF5252' stroke='#000' stroke-width='1'/>"
        "<circle cx='112' cy='100' r='5' fill='#66BB6A' stroke='#000' stroke-width='1'/>"
        "</svg>";

    function getSvgData() external pure returns (string memory) {
        return SVG_DATA;
    }

    function getTraits()
        external
        pure
        returns (string memory color, string memory accessory, string memory mood, string memory special)
    {
        return ("Pink", "Raised Arms", "Celebratory", "None");
    }
}
