// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Bytes4Mapping} from "../contracts/Bytes4Mapping.sol";

contract TestBytes4Mapping is Test {
    Bytes4Mapping private _layout;

    function setUp() public {
        _layout = new Bytes4Mapping();
    }

    function testSet() public {
        _layout.set(0, hex"ffffffff");
        _layout.set(1, hex"eeeeeeee");
        console.logBytes32(
            vm.load(
                address(_layout),
                keccak256(abi.encodePacked(uint256(0), uint256(0)))
            )
        );
        console.logBytes32(
            vm.load(
                address(_layout),
                keccak256(abi.encodePacked(uint256(1), uint256(0)))
            )
        );
    }
}
