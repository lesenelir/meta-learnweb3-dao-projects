// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// view & pure

// get functions (return values function) can be declared `view` or `pure`

// view: do not change any state variable values
// pure: do not change any state variable values and do not read any state values

// view 可读
// pure 不可读

contract ViewAndPure {
    uint public x = 1;

    // can not modify the state, but can read state
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    // can not modify the state or read from state
    // pure函数 return a value, 但是只能是参数的变量，而不是 state变量
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}

