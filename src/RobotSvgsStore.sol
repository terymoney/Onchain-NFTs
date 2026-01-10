// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

/// @title RobotSvgsStore
/// @author Maria Terese Ezeobi
/// @notice Stores references to individual SVG contracts that expose `getSvgData()`.
/// @dev Owner registers SVG contract addresses by index; anyone can read SVG data by index.
contract RobotSvgsStore is Ownable {
    mapping(uint256 => address) private s_svgContracts;

    event SvgRegistered(uint256 indexed index, address indexed svgContract);

    error RobotSvgsStore__ZeroAddress();
    error RobotSvgsStore__NotAContract(address candidate);
    error RobotSvgsStore__SvgNotFound(uint256 index);
    error RobotSvgsStore__FetchFailed(address svgContract);

    /// @dev OZ Ownable in your repo requires an initial owner argument.
    constructor() Ownable(msg.sender) {}

    function registerSvg(uint256 index, address svgContract) external onlyOwner {
        if (svgContract == address(0)) revert RobotSvgsStore__ZeroAddress();
        if (svgContract.code.length == 0) revert RobotSvgsStore__NotAContract(svgContract);

        s_svgContracts[index] = svgContract;
        emit SvgRegistered(index, svgContract);
    }

    function getSvgContract(uint256 index) external view returns (address) {
        return s_svgContracts[index];
    }

    function getSvg(uint256 index) external view returns (string memory svgData) {
        address svgContract = s_svgContracts[index];
        if (svgContract == address(0)) revert RobotSvgsStore__SvgNotFound(index);

        (bool success, bytes memory data) =
            svgContract.staticcall(abi.encodeWithSignature("getSvgData()"));

        if (!success) revert RobotSvgsStore__FetchFailed(svgContract);

        return abi.decode(data, (string));
    }
}
