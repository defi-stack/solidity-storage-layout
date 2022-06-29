// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Bytes4DynamicArray} from "../contracts/Bytes4DynamicArray.sol";

contract TestBytes4DynamicArray is Test {
    Bytes4DynamicArray private _layout; // slot 0

    function setUp() public {
        _layout = new Bytes4DynamicArray();
    }

    function testSet() public {
        _layout.push(hex"ffffffff");
        _layout.push(hex"ffffffcc");
        console.logBytes32(
            vm.load(address(_layout), keccak256(abi.encodePacked(uint256(0))))
        );
    }
}
