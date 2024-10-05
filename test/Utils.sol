// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/Test.sol";
import {Base64} from "openzeppelin/utils/Base64.sol";

abstract contract TestNft is Test {
    function assertStringEq(string memory expected, string memory actual) public pure {
        assertEq(keccak256(abi.encodePacked(expected)), keccak256(abi.encodePacked(actual)));
    }
}
