// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script} from "forge-std/Script.sol";
import {Base64} from "openzeppelin/utils/Base64.sol";
import {MoodNft} from "src/MoodNft.sol";

contract DeployMoodNft is Script {
    uint256 public constant DEFAULT_ANVIL_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURI = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(abi.encodePacked(svg));
        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }

    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("img/dynamicNft/sad.svg");
        string memory happySvg = vm.readFile("img/dynamicNft/happy.svg");

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(svgToImageURI(sadSvg), svgToImageURI(happySvg));
        vm.stopBroadcast();
        return moodNft;
    }
}
