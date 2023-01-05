// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Immutable {
    // immutable 修饰符，和constant一样也是修饰变量
    // immutable 意为： 不变
    // immutable 修饰的变量，只可以在构造函数中赋值，除此之外，不能在其他地方进行修改

    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }

}
