// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solidity 支持多继承， 用关键词 is 进行继承
// 可以被子合同重写的函数，必须用 virtual 进行声明
// 覆盖一个父函数的函数必须使用关键词 override 进行声明 （重写）
// Solidity 支持多继承，并且 继承的顺序是很重要的
// 继承顺序；必须按照"most base-like 最基本" 到 "most derived 最衍生" 的顺序列出父合同


/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    // virtual 关键词代表： 该函数可以被子类合同进行重写
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // 重写 父类A 的 foo 方法
    function foo() public pure virtual override returns (string memory) {
        return 'B';
    }
}

contract C is A {
    // 重写 父类A 的 foo 方法
    function foo() public pure virtual override returns (string memory) {
        return 'C';
    }
}

// 当一个在不同合同中都定义的函数被调用时，父合同将从右至左以深度优先的方式进行搜索
// 深度优先遍历方式，若C找到 foo 则不再去找 B中的foo
contract D is B, C {
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo(); // return 'C'
    }
}

contract E is C, B {
    function foo() public pure override(C, B) returns (string memory) {
        return super.foo(); // return 'B'
    }
}

// 继承 交换A， B 的顺序 会报编译错误
// 继承的顺序：需要按照从 "最基本" 到 "最衍生" 的顺序进行排序
contract F is A, B {
    function foo() public pure override (A, B) returns (string memory) {
        return super.foo();
    }
}

