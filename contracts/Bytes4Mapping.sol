// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bytes4Mapping {
    mapping(uint256 => bytes4) _map; // slot 0

    function get(uint256 index) external view returns (bytes4) {
        return _map[index];
    }

    function set(uint256 key, bytes4 val) external returns (bool) {
        _map[key] = val;
        return true;
    }
}
