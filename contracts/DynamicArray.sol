// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Slot } from "./SlotUtils.sol";

/// @title A contract to demo how to operate array with slot
/// @author wiasliaw <wiasliaw@protonmail.com>
contract DynamicArrayLayout {
    uint256[] private _arr; // slot 0

    function get(uint256 index) external view returns (uint256) {
        // `_arr[i]`'s data store in `keccak256(ARR_SLOT) + index`
        // ARR_SLOT store the length of _arr
        uint256 s = uint256(keccak256(abi.encodePacked(uint256(0)))) + index;
        return Slot.getSlot(bytes32(s)).value;
    }

    function push(uint256 val) external returns (bool) {
        _arr.push(val);
        return true;
    }
}
