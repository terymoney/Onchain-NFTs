// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

import {RobotSvgsStore} from "./RobotSvgsStore.sol";

/// @title RobotNft
/// @author Maria Terese Ezeobi
/// @notice Fully on-chain Robot NFT collection that renders SVGs from a store.
/// @dev Each token stores an SVG index; tokenURI builds Base64 JSON with a Base64 SVG image.
contract RobotNft is ERC721, Ownable {
    /// @notice Store that resolves svgIndex -> SVG string via getSvg(index).
    RobotSvgsStore public immutable svgStore;

    /// @notice Mapping from tokenId => svgIndex in the store.
    mapping(uint256 tokenId => uint256 svgIndex) public tokenToSvgIndex;

    /// @notice Emitted when a robot is minted.
    event RobotMinted(address indexed to, uint256 indexed tokenId, uint256 indexed svgIndex);

    /// @notice Thrown when minting to the zero address.
    error RobotNft__ZeroAddress();

    /// @notice Thrown when querying metadata for a nonexistent token.
    error RobotNft__NonexistentToken(uint256 tokenId);

    /// @notice Creates the Robot NFT and sets the SVG store address.
    /// @param _svgStore Address of the RobotSvgsStore contract.
    constructor(address _svgStore) ERC721("RobotNFT", "RNFT") Ownable(msg.sender) {
        if (_svgStore == address(0)) revert RobotNft__ZeroAddress();
        svgStore = RobotSvgsStore(_svgStore);
    }

    /// @notice Mints a new robot NFT.
    /// @dev Only owner can mint (use scripts to mint full sets).
    /// @param to Receiver address.
    /// @param tokenId Token ID to mint.
    /// @param svgIndex Index in the SVG store for this token.
    function mint(address to, uint256 tokenId, uint256 svgIndex) external onlyOwner {
        if (to == address(0)) revert RobotNft__ZeroAddress();

        // If tokenId already minted, _mint will revert.
        _mint(to, tokenId);

        tokenToSvgIndex[tokenId] = svgIndex;

        emit RobotMinted(to, tokenId, svgIndex);
    }

    /// @notice Returns the metadata URI for a token, encoded as a data: URI.
    /// @param tokenId Token ID to query.
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        // Revert if token doesn't exist (prevents fake URIs for unminded tokenIds)
        if (_ownerOf(tokenId) == address(0)) revert RobotNft__NonexistentToken(tokenId);

        uint256 svgIndex = tokenToSvgIndex[tokenId];
        string memory svgData = svgStore.getSvg(svgIndex);

        // Base64 encode the raw SVG
        string memory imageBase64 = Base64.encode(bytes(svgData));

        // Build JSON, then Base64 encode it
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name":"Robot #',
                        _uint2str(tokenId),
                        '","description":"A robot NFT","image":"data:image/svg+xml;base64,',
                        imageBase64,
                        '"}'
                    )
                )
            )
        );

        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    /// @dev Converts uint256 to string (decimal).
    function _uint2str(uint256 value) internal pure returns (string memory) {
        if (value == 0) return "0";

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);
        uint256 index = digits;

        temp = value;
        while (temp != 0) {
            index--;
            buffer[index] = bytes1(uint8(48 + (temp % 10)));
            temp /= 10;
        }

        return string(buffer);
    }
}
