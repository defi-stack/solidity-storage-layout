// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringStorage {
    string public str;

    struct Slot {
        bytes32 value;
    }

    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/StorageSlot.sol
    function _getSlot(bytes32 slot_) internal pure returns (Slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }

    function get(uint256 index) external view returns (bytes32) {
        return _getSlot(bytes32(index)).value;
    }

    function set(string memory str_) external {
        str = str_;
    }
}
