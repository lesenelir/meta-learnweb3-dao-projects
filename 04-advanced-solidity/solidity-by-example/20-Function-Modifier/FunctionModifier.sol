// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionModifier {
    // 函数修改器：可以在函数调用之前 or 函数调用之后运行的代码
    // 函数修改器应用场景：
    // - 限制访问
    // - 验证输入
    // - 防止reentrancy hack

    address public owner;
    uint public x = 10;
    bool public locked;

    constructor () {
        // 设置交易发送方sender为合约的所有者owner
        owner = msg.sender;
    }

    // 修饰器 去检查 调用者 是否是合约的所有者
    modifier onlyOwner() {
        require(msg.sender == owner, 'Not owner');
        // _ 是一个特殊的字符，只用于函数修饰器中，意为：告诉solidity去执行剩余的代码
        _;
    }

    // 修饰器 可以拿到input输入，修饰器去检查 传入的地址 不是 zero address
    modifier validAddress(address _addr) {
        require(_addr != address(0), 'Not valid address');
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // 以下修饰器可以防止函数在执行时被调用
    modifier noReentrancy() {
        require(!locked, 'No reentrancy');
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }

}
