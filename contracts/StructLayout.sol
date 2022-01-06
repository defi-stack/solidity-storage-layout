// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructLayout {
    struct Custom1 {
        uint256 foo;
        uint256 bar;
    }

    // https://github.com/Uniswap/v3-core/blob/main/contracts/UniswapV3Pool.sol#L56
    /**
     * 0x0001_06_0005_0004_0003_000002_0000000000000000000000000000000000000001
     */
    struct Custom2 {
        uint160 a; // the right
        int24 b;
        uint16 c;
        uint16 d;
        uint16 e;
        uint8 f;
        bool g; // the left
    }

    /**
     * 0x01_01_06_0005_0004_0003_000002_0000000000000000000000000000000000000001
     */
    struct Custom3 {
        uint160 a;
        int24 b;
        uint16 c;
        uint16 d;
        uint16 e;
        uint8 f;
        bool g;
        bool h;
    }

    struct Slot {
        uint256 value;
    }

    Custom1 public custom;
    Custom2 public s0;

    // https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/StorageSlot.sol
    function _getSlot(bytes32 slot_) internal pure returns (Slot storage ret) {
        assembly {
            ret.slot := slot_
        }
    }

    function setFoo(uint256 foo_) external {
        Slot storage fooPtr = _getSlot(0);
        fooPtr.value = foo_;
    }

    function setBar(uint256 bar_) external {
        Slot storage barPtr = _getSlot(bytes32(uint256(1)));
        barPtr.value = bar_;
    }

    function setCustom2(
        uint160 a,
        int24 b,
        uint16 c,
        uint16 d,
        uint16 e,
        uint8 f,
        bool g
    ) external {
        s0 = Custom2({a: a, b: b, c: c, d: d, e: e, f: f, g: g});
    }
}
