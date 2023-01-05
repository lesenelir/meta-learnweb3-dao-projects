// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// 子合同中不能override 父合同中的state Variables

// 正确重写 继承来的state 变量 的 步骤：

contract A {
    string public name = 'Contract A';

    function getName() public view returns (string memory) { // view 可读不能写
        return name;
    }
}


// Shadowing 来自于 Solidity 0.6

contract C is A {
    // 正确 重写父类的 state variables
    constructor() {
        name = 'Contract C';
    }
}




