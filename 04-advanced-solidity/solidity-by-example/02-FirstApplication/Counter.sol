// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint public count;

    // returns 只作用在view视图函数
    function get() public view returns (uint) {
        return count;
    }

    function inc() public {
        count += 1;
    }

    function dec() public {
        // 由于count 是 uint ，所以当count为0时该函数会调用失败
        count -= 1;
    }
}
