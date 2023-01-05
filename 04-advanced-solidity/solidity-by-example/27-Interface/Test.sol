// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 定义接口 Interface 可以和其他合约进行交互

// 接口：
// - 不能被任何函数实现
// - 可以继承其他的接口
// - 接口中的所有函数 必须声明为 external
// - 接口中不能定义构造函数 constructor
// - 接口中不能定义 state variable


contract Counter {
    uint public count;

    // 给其他合约调用的函数
    function increment() external {
        count += 1;
    }

}

// 接口
interface ICounter {
    function count() external view returns (uint);

    function increment() external;
}

contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}

// Uniswap example
interface UniswapV2Factory {
    // getter 都需要有 view or pure 其中一个来修饰
    // view 只读不能写
    // pure 不能读不能写
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Factory(pair).getPair();
        return (reserve0, reserve1);
    }
}



