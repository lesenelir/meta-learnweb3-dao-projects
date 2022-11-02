// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Inheritance: contract A can inherit the attributes and methods of another contract
// Solidity supports multiple inheritance
// keyword: is

// parent function that can be overridden by a child contract
// must be declared as a `virtual` function
// 可被子类重写的父类函数需要定义为 virtual function

// a child that is going to override a parent function must use the `override` keyword
// 子类重写父类函数，子类需要给重写的函数声明关键字：override

// The order of inheritance matters
// if parent contracts share methods or attributes by the same name.
// 如果多继承有多个父类的属性或方法是同名的，则继承顺序很重要


/* Graph of inheritance
  A
 /  \
B    C
|\  /|
| \/ |
| /\ |
D    E
*/
contract A {
    // virtual foo function which can be overridden by child component
    function foo() public pure virtual returns (string memory) {
        return 'A';
    }
}

contract B is A {
    // Override A.foo()
    // virtual and override - the child contract can also override this function
    // B.foo()
    function foo() public pure virtual override returns (string memory) {
        return 'B';
    }
}

contract C is A {
    // C.foo()
    function foo() public pure virtual override returns (string memory) {
        return 'C';
    }
}

// When inheriting from multiple contracts,
// if a function is defined multiple times, the right-most parent contract's function is used
// 多继承是从右往左开始执行
contract D is B, C {
    // D.foo() returns 'C'
    // the right-most parent
    function foo() public pure override(B, C) returns (string memory) {
        // 此时的super.foo() 是调用最右边的合约的foo函数
        return super.foo();
    }
}

contract E is C, B {
    // E.foo() returns 'B'
    function foo() public pure override(C, B) returns (string memory) {
//        return C.foo();
        return super.foo();
    }
}

