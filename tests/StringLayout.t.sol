// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../contracts/StringLayout.sol";

contract TestString is Test {
    StringLayout private _layout; // slot 0

    function setUp() public {
        _layout = new StringLayout();
    }

    function testSetLess31Bytes() public {
        /**
         * - string will store in slot 0 with left aligned
         * - the length of string will store in the last bytes
         */
        _layout.set("hello world"); // 68 65 6c 6c 6f 20 77 6f 72 6c 64
        console.logBytes32(vm.load(address(_layout), 0)); // length = 0x16
    }

    function testSetLarger31Bytes() public {
        /**
         * - string will store in keccak256(main slot index) with left aligned
         * - the length of string will store in the main slot (slot 0) with `length * 2 + 1`
         */
        _layout.set(
            "hello world hello world hello world hello world hello world hello world hello world"
        ); // length = 0x53
        console.logBytes32(vm.load(address(_layout), 0)); // 0x53 * 2 + 1 = 0xa7

        uint256 b = uint256(keccak256(abi.encodePacked(uint256(0))));
        console.logBytes32(vm.load(address(_layout), bytes32(b))); // string data
        console.logBytes32(vm.load(address(_layout), bytes32(b + 1))); // string data
        console.logBytes32(vm.load(address(_layout), bytes32(b + 2))); // string data
    }
}
