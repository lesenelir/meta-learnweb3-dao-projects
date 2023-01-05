// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    // 声明一个保存在链上的state变量
    uint public num;

    // 发起一笔交易（调用合约中的函数）

    // 发起一笔交易去修改合约链上的state变量
    function set(uint _num) public {
        num = _num;
    }

    // 读取合约中的state变量，则不需要交易费用
    function get() public view returns (uint) {
        return num;
    }

}
