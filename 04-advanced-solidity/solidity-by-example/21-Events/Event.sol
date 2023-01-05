// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Event {
    // events 允许记录到以太坊区块链上
    // events使用场景：
    // - 监听events 并更新 用户接口
    // - A cheap form of storage

    // Event 定义
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, 'Hello World');
        emit Log(msg.sender, 'Hello EVM');
        emit AnotherLog();
    }

}
