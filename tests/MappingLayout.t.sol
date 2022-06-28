// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../contracts/MappingLayout.sol";

contract TestMappingLayout is Test {
    MappingLayout private _layout;

    function setUp() public {
        _layout = new MappingLayout();
    }

    function testSet() public {
        assertTrue(_layout.set(12, 34));
        bytes32 val = vm.load(
            address(_layout),
            keccak256(abi.encodePacked(uint256(12), uint256(0)))
        );
        assertEq(uint256(val), 34);
    }

    function testGet() public {
        vm.store(
            address(_layout),
            keccak256(abi.encodePacked(uint256(12), uint256(0))),
            bytes32(uint256(56))
        );
        assertEq(_layout.get(12), 56);
    }
}
