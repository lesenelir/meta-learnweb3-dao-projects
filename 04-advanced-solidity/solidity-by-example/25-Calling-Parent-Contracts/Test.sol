// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 调用父合约的方式： 1. 直接调用 2. 通过关键词 super调用
// 某个合约使用关键词 super时，该合约继承的所有父合约都直接被调用

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

contract A {
    // 可以通过函数 emit events， 并记录到transaction log交易记录上
    // 这对追踪函数的调用很有效果
    event Log(string message);

    function foo() public virtual {
        emit Log('A.foo called');
    }

    function bar() public virtual {
        emit Log('A.bar called');
    }

}


contract B is A {
    function foo() public virtual override {
        emit Log('B.foo called');
        A.foo(); // 直接调用父类方法
    }

    function bar() public virtual override {
        emit Log('B.bar called');
        super.bar(); // 通过super调用父类方法
    }
}


contract C is A {
    function foo() public virtual override {
        emit Log('C.foo called');
        A.foo();
    }

    function bar() public virtual override {
        emit Log('C.bar called');
        super.bar();
    }
}


contract D is B, C {
    // D.foo()  先执行 C合约的foo 再执行 A合约的 foo
    function foo() public override(B, C) {
        super.foo();
    }

    // D.bar() 先执行C合约的bar 再执行 B合约的bar 最后执行A合约的bar
    // D.bar() 先找C中有没有bar ， 如果 C中有bar 则不再调用 B 的 bar
    function bar() public override(B, C) {
        super.bar();
    }
}



