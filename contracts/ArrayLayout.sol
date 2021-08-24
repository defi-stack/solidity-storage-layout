// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A contract to demo how to operate array with slot
/// @author wiasliaw
contract ArrayLayout {
    uint256[] private _arr;

    struct Slot {
        uint256 value;
    }

    function _getSlot(bytes32 slot_) internal pure returns (Slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }

    function get(uint256 index) public view returns (uint256) {
        uint256 s = uint256(keccak256(abi.encodePacked(uint256(0)))) + index;
        return _getSlot(bytes32(s)).value;
    }

    function push(uint256 val) public {
        _arr.push(val);
    }

    function update(uint256 index, uint256 val) public {
        uint256 s = uint256(keccak256(abi.encodePacked(uint256(0)))) + index;
        _getSlot(bytes32(s)).value = val;
    }

    function del(uint256 index) public {
        uint256 s = uint256(keccak256(abi.encodePacked(uint256(0)))) + index;
        delete _getSlot(bytes32(s)).value;
    }
}
