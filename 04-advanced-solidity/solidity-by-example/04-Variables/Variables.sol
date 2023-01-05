// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    // 变量类型
    // local  声明在函数中；不在链上进行存储
    // state  声明在函数外；在链上进行存储
    // global 提供区块链的一些信息

    // state变量， 保存在链上
    string public text = 'Hello';
    uint public num = 233;

    function doSomething() public {
        // local变量， 不保存在链上
        uint i = 456;

        // global 提供区块链信息
        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }

}
