// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title A contract to demo inheritance
/// @author wiasliaw
contract Storage1 {
    uint256 private value1;
    uint256 private value2;

    function getV1() external view returns (uint256 ret) {
        ret = value1;
    }

    function setV1(uint256 value_) external {
        value1 = value_;
    }
}

contract Storage2 {
    uint96 private value1;

    function getV2() external view returns (uint256 ret) {
        ret = value1;
    }

    function setV2(uint96 value_) external {
        value1 = value_;
    }
}

contract Inheritance is Storage1, Storage2 {
    address private _admin;

    function getI() external view returns (address ret) {
        ret = _admin;
    }

    function setI(address newAdmin_) external {
        _admin = newAdmin_;
    }
}
