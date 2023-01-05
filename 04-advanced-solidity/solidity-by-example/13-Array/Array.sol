// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array {
    // 智能合约Array 可以是固定长度数组 、 动态长度数组
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];
    // 固定长度但是没有初始化，默认值为0
    uint[10] public myFixedSizeArr;

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function push(uint x) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // delete方法 不会修改数组长度
        // delete方法 是把元素值设置为default value
        // 对于一个uint数组而言，default value 是 0
        delete arr[index];
    }

    function examples() external {
        // memory 关键词 是 内存
        // 在内存中创建数组
        // 内存中创建的数组一定是长度固定的
        uint[] memory a = new uint[](5);
    }

}
