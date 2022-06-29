// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bytes4DynamicArray {
    bytes4[] private _arr; // slot 0

    function get(uint256 index) external view returns (bytes4) {
        return _arr[index];
    }

    function push(bytes4 val) external returns (bool) {
        _arr.push(val);
        return true;
    }
}
