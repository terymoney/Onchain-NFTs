// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg5 is IRobotSvg {
    // 05 — purple robot with headphones + equalizer
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#E1C8FF' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#E1C8FF' stroke='#000' stroke-width='3'/>"
        "<path d='M62 36 A38 30 0 0 1 138 36' fill='none' stroke='#000' stroke-width='6' stroke-linecap='round'/>"
        "<rect x='60' y='30' width='12' height='18' rx='3' fill='#000'/>"
        "<rect x='128' y='30' width='12' height='18' rx='3' fill='#000'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<rect x='110' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<line x1='92' y1='46' x2='108' y2='46' stroke='#000' stroke-width='2' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#E1C8FF' stroke='#000' stroke-width='3'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#E1C8FF' stroke='#000' stroke-width='3'/>"
        "<rect x='78' y='86' width='8' height='28' fill='#FF5252'/>"
        "<rect x='92' y='78' width='8' height='36' fill='#FFD54F'/>"
        "<rect x='106' y='82' width='8' height='32' fill='#66BB6A'/>"
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
        return ("Violet", "Headphones", "Groovy", "None");
    }
}
