// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import { DynamicArrayLayout } from "../contracts/DynamicArray.sol";

contract TestFixedSizeArray is Test {
    DynamicArrayLayout private _layout;

    uint256 constant SLOT0 = uint256(keccak256(abi.encodePacked(uint256(0))));

    function setUp() public {
        _layout = new DynamicArrayLayout();
    }

    function testPush() public {
        bytes32 val;

        // _arr[0] = 11
        assertTrue(_layout.push(11));
        val = vm.load(address(_layout), bytes32(SLOT0 + 0));
        _validateLength(1);
        assertEq(uint256(val), 11);

        // _arr[1] = 11
        assertTrue(_layout.push(22));
        val = vm.load(address(_layout), bytes32(SLOT0 + 1));
        _validateLength(2);
        assertEq(uint256(val), 22);
    }

    function _validateLength(uint256 shouldBe) private {
        bytes32 len = vm.load(address(_layout), bytes32(uint256(0)));
        assertEq(uint256(len), shouldBe);
    }
}
