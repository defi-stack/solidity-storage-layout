// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import { FixedSizeArrayLayout } from "../contracts/FixedSizeArray.sol";

contract TestFixedSizeArray is Test {
    FixedSizeArrayLayout private _layout;

    function setUp() public {
        _layout = new FixedSizeArrayLayout();
    }

    function testSetInRange() public {
        assertTrue(_layout.update(0, 1));
        bytes32 val = vm.load(address(_layout), bytes32(uint256(0)));
        assertEq(uint256(val), 1);
    }

    function testSetOutOfRange() public {
        assertTrue(_layout.update(10, 33));
        bytes32 val = vm.load(address(_layout), bytes32(uint256(10)));
        assertEq(uint256(val), 33);
    }
}
