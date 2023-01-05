// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Error {
    // 一个error 将撤销在交易期间所有对状态state所做的所有改变

    // 抛出错误的方式：
    //  - require : 通常用于在执行前验证输入和条件
    //  - revert : 类似于 require
    //  - assert : 通常用于检查不应该为假的代码，断言失败意味着有bug

    function testRequire(uint _i) public pure {
        // require 应用于验证条件
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions 调用其他函数的返回值
        require(_i > 10, 'input must be greater than 10');
    }

    function testRevert(uint _i) public pure {
        // revert 一般用于 condition 条件 check 完毕
        // revert 类似于  require
        if (_i <= 10) {
            revert('Input must be greater than 10');
        }
    }

    uint public num;

    function testAssert() public view {
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint balance, uint withdrawAmout);

    function testCustomError(uint balance, uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }

}
