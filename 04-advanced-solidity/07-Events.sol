// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Perform logging on the Ethereum blockchain

// used to allow fronted interfaces to listen for specific events
// and update interface, or used as a cheap form of storage
contract Events {

    // declare an event which logs an address and a string
    event TestCalled(address sender, string message);

    function test() public {
        // emit Log
        emit TestCalled(msg.sender, 'Someone called test()');
    }
}

// Note:
// - 打印输出日志Log
// - Log用途：前端界面监听特定的Log以便更新用户界面UI
