// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A contract to demo how to operate a specified slot
/// @author wiasliaw
contract SimpleStorage {
    bytes32 private constant _MAX_SLOT = bytes32(type(uint256).max);

    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/StorageSlot.sol
    struct Slot {
        uint256 value;
    }

    function _getSlot(bytes32 slot_) internal pure returns (Slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }

    function get() public view returns (uint256) {
        return _getSlot(_MAX_SLOT).value;
    }

    function set(uint256 val_) public {
        _getSlot(bytes32(_MAX_SLOT)).value = val_;
    }
}
