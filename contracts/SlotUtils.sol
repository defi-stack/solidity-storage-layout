// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Slot {
    struct slot {
        uint256 value;
    }

    function getSlot(bytes32 slot_) internal pure returns (slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }
}
