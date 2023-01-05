// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {

    // function 和 state variable 都必须要声明 是否可以被其他合约访问

    // function 可以声明类型：
    // - public 任何合约都可以调用该方法
    // - private 只在定义该函数的合约中可以调用
    // - internal 定义该函数的合约中 和 继承该合约方法的合约内调用
    // - external 只有其他合约和账户可以调用该方法 （external定义的函数，本合约是不能调用的）

    // state variable 可以声明 （state variable 没有 external）
    // public
    // private
    // internal


    // private修饰的函数 只能在该合约内部调用；继承该合约的子合约不能调用private 声明的方法
    function privateFunc() private pure returns (string memory) {
        return 'private function called';
    }

    function testPrivate() public pure returns (string memory) {
        return privateFunc();
    }


    // internal修饰的函数，调用的情况：
    // - 定义internal 函数的合约
    // - 继承该合约的子合约中
    function internalFunc() internal pure returns (string memory) {
        return 'internal function called';
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }


    // public 修饰的函数，调用情况：
    // - 定义该函数的合约
    // - 继承该合约的子合约
    // - 其他合约和账户
    function publicFunc() public pure returns (string memory) {
        return 'public function called';
    }


    // external 修饰的函数，调用情况：
    // - 其他合约和账户
    function externalFunc() external pure returns (string memory) {
        return 'external function called';
    }


    // state variable
    string private privateVar = 'my private variable';
    string internal internalVar = 'my Internal variable';
    string public publicVar = 'my public variable';

    // Note: state variable 不能用external 修饰

}

contract Child is Base {
    // 子类合约不能去调用父类合约的 private 方法 和 state 变量

    // 子类合约只可以去调用 父类合约的 internal 方法

    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }

}


