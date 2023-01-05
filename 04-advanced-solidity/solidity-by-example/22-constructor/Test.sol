// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// constructor 构造器 是一个可选的函数，它在合约被创建时执行


// 举例向constructor 传递参数的方式：

contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract Y {
    string public text;
    constructor(string memory _text) {
        text = _text;
    }
}


// 有两种方式用参数去初始化父合约 parent contract
// 1. 在继承列表中传递参数
contract B is X("Input to X"), Y("Input to Y") {

}

// 2. 继承后，在构造函数中传递参数。 类似于函数修改器modifier
contract C is X, Y {
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}
// Note: 父类构造函数是按照继承的顺序进行调用，不管在子构造函数列出的父合同的顺序如何


// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}


// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}

