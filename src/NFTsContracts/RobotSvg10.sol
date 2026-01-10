// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg10 is IRobotSvg {
    // 10 — gentleman robot with monocle and mustache
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#FFDAB9' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#FFDAB9' stroke='#000' stroke-width='3'/>"
        "<rect x='82' y='30' width='8' height='8' rx='2' fill='#000'/>"
        "<circle cx='116' cy='34' r='6' fill='#000'/>"
        "<line x1='122' y1='28' x2='136' y2='18' stroke='#000' stroke-width='1.5'/>"
        "<path d='M90 50 C94 54 106 54 110 50' stroke='#000' stroke-width='2' fill='none' stroke-linecap='round'/>"
        "<line x1='92' y1='56' x2='108' y2='56' stroke='#000' stroke-width='1.8' stroke-linecap='round'/>"
        "<rect x='48' y='86' width='12' height='44' rx='6' fill='#FFDAB9' stroke='#000' stroke-width='3'/>"
        "<rect x='140' y='86' width='12' height='44' rx='6' fill='#FFDAB9' stroke='#000' stroke-width='3'/>"
        "<circle cx='100' cy='100' r='6' fill='#FFF' stroke='#000' stroke-width='1.2'/>"
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
        return ("Peach Beige", "Monocle", "Elegant", "Mustache");
    }
}
