// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// delegatecall 类似于call

// 当合约A 向 合约B 执行 delegatecall 则 合约B的代码也执行


// NOTE: Deploy this contract first
contract B {
    // storage 变量 一定要和 合约A 一样
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }

}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A 的storage is set ， B 没有modified
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

}

