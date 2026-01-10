// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IRobotSvg} from "../interfaces/IRobotSvg.sol";

contract RobotSvg6 is IRobotSvg {
    // 06 — blue robot with sunglasses visor + LED core
    string internal constant SVG_DATA =
        "<svg width='200' height='200' viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'>"
        "<rect x='60' y='60' width='80' height='88' rx='12' fill='#90CAF9' stroke='#000' stroke-width='3'/>"
        "<rect x='70' y='22' width='60' height='40' rx='8' fill='#90CAF9' stroke='#000' stroke-width='3'/>"
        "<rect x='76' y='30' width='48' height='12' rx='6' fill='#000'/>"
        "<circle cx='88' cy='36' r='1.2' fill='#FFF'/>"
        "<circle cx='112' cy='36' r='1.2' fill='#FFF'/>"
        "<line x1='88' y1='46' x2='112' y2='46' stroke='#000' stroke-width='2' stroke-linecap='round'/>"
        "<g transform='translate(48,86)'><rect x='0' y='0' width='12' height='44' rx='6' fill='#90CAF9' stroke='#000' stroke-width='3'/></g>"
        "<g transform='translate(140,86)'><rect x='0' y='0' width='12' height='44' rx='6' fill='#90CAF9' stroke='#000' stroke-width='3'/></g>"
        "<circle cx='100' cy='100' r='6' fill='#00E5FF' stroke='#000' stroke-width='1'/>"
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
        return ("Sky Blue", "Sunglasses Visor", "Cool", "LED Core");
    }
}
