// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewAndPure {
    // getter函数 可以被定义为 view 和 pure

    // view函数：no state will be changed
    // pure函数：no state will be changed or read

    uint public x = 1;

    // view 函数： 不修改状态
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // pure 函数： 不修改、读取 状态
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }

}
