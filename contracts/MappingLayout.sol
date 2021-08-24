// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A contract to demo how to operate mapping with slot
/// @author wiasliaw
contract MappingLayout {
    mapping(uint256 => uint256) private _map;

    struct Slot {
        uint256 value;
    }

    function _getSlot(bytes32 slot_) internal pure returns (Slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }

    function get(uint256 key) public view returns (uint256 ret) {
        bytes32 b = keccak256(abi.encodePacked(key, uint256(0)));
        ret = _getSlot(b).value;
    }

    function update(uint256 key, uint256 val) public {
        bytes32 b = keccak256(abi.encodePacked(key, uint256(0)));
        _getSlot(b).value = val;
    }

    function del(uint256 key) public {
        bytes32 b = keccak256(abi.encodePacked(key, uint256(0)));
        delete _getSlot(b).value;
    }
}
