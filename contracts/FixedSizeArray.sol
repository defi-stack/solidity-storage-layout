// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Slot } from "./SlotUtils.sol";

/// @title A contract to demo how to operate fixed size array with slot
/// @author wiasliaw <wiasliaw@protonmail.com>
contract FixedSizeArrayLayout {
    uint256[5] private _arr;

    function get(uint256 index) external view returns (uint256) {
        return Slot.getSlot(bytes32(index)).value;
    }

    /// @dev may update slot which is not in array
    function update(uint256 index, uint256 value) external returns (bool) {
        Slot.getSlot(bytes32(index)).value = value;
        return true;
    }
}
