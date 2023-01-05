// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Function {

    // 函数输出return output的方式：

    // 1. 函数可以返回多个值
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // 2. return values 可以被命名
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // 3. 省略返回语句 return 的情况：
    // 函数定义时return value 被命名，且函数体返回了相应的名称
    function assigned() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }


    // 4. 调用一个函数，并用解构的方式获得该函数返回的变量值
    function destructuringAssignments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany(); // 解构方式获得值
        (uint x, , uint y) = (4, 5, 6);
        return (i, b, j, x, y);
    }

    // public 声明的函数有些data types数据类型不能作为input output

    // 不能使用map 作为函数的输入 和 输出

    // 可以将数组array 作为函数的输入
    function arrayInput(uint[] memory _arr) public {}

    // 可以将数组array 作为函数的输出
    uint[] public arr;
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }

}
