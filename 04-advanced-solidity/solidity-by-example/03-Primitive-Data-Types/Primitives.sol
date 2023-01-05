// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// bool uint int address
contract Primitives {
    bool public boo = true;

    // uint 代表"无符号整形" > 0
    // uint256 === [0, 2 ** 256 - 1]
    uint8 public u8 = 1;
    uint public u256 = 456; // uint 是 uint256 的别名

    // int 允许有 负数
    // int256 === [-2**255, 2**255-1]
    int8 public i8 = -1;
    int public i256 = -456; // int 是 int256 的别名

    // int的最大值和最小值
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    // int public maxUint = type(uint).max; // 报错

    address public addressMe = 0xedcB55e4A906054CA6E5a1Fdc921867be5E4Ed63;

    // Default values
    // 没有赋值的变量都有一个默认值
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddress; // 0x0000000000000000000000000000000000000000

}
