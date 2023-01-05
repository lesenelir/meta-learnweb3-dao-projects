// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocations {
    // 变量可以分为： storage memory calldata
    // storage：变量是一个state变量，（一般都是定义在函数外部，存储在区块链上）
    // memory： memory类型变量，保存在内存中，当一个函数被调用时，该类型变量存在
    // calldata：包含函数参数的特殊变量

    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct {
        uint foo;
    }
    mapping(uint => MyStruct) myStructs;

    function f() public {
        // 用state变量调用 _f函数
        _f(arr, map, myStructs[1]);

        // 通过map 获得 struct
        MyStruct storage myStruct = myStructs[1];
        // 在内存中创建一个 struct
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
    }

    // return 获得 内存变量
//    function g(uint[] memory _arr) public returns (uint[] memory) {
//        // do something with memory array
//    }

    function h(uint[] calldata _arr) external {
        // do something with calldata array
    }

}
