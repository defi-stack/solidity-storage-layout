// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A2 {
    uint256 public other;
    uint256 public value;

    function add(
        address b,
        uint256 x,
        uint256 y
    ) public returns (bool) {
        (bool success, ) = b.delegatecall(
            abi.encodeWithSelector(
                bytes4(keccak256("add(uint256,uint256)")),
                x,
                y
            )
        );
        return success;
    }
}

contract B2 {
    uint256 public value;

    function add(uint256 x, uint256 y) public returns (uint256) {
        value = x + y;
        return value;
    }
}
