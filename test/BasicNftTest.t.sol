// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test} from "forge-std/src/Test.sol";
import {DeployBasicNft} from "script/DeployBasicNft.s.sol";
import {BasicNft} from "src/BasicNft.sol";

contract TestBasicNft is Test {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER;

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
        USER = makeAddr("USER");
    }

    function assertStringEq(string memory expected, string memory actual) public pure {
        assertEq(keccak256(abi.encodePacked(expected)), keccak256(abi.encodePacked(actual)));
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();

        assertStringEq(expectedName, actualName);
    }

    function testUserCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintNft(PUG_URI);

        assertEq(basicNft.balanceOf(USER), 1);
        assertStringEq(PUG_URI, basicNft.tokenURI(0));
    }
}
