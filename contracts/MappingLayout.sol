// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Slot } from "./SlotUtils.sol";

/// @title A contract to demo how to operate mapping with slot
/// @author wiasliaw <wiasliaw@protonmail.com>
contract MappingLayout {
    mapping(uint256 => uint256) private _map; // slot 0

    function get(uint256 key) external view returns (uint256) {
        bytes32 slotIndex = keccak256(abi.encodePacked(key, uint256(0)));
        return Slot.getSlot(slotIndex).value;
    }

    function set(uint256 key, uint256 val) external returns (bool) {
        // map[key] = val
        // `val` will store in slot[keccak256(key, mapSlot)]
        bytes32 slotIndex = keccak256(abi.encodePacked(key, uint256(0)));
        Slot.getSlot(slotIndex).value = val;
        return true;
    }
}
