// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringLayout {
    string public str;

    function set(string memory str_) external {
        str = str_;
    }
}
