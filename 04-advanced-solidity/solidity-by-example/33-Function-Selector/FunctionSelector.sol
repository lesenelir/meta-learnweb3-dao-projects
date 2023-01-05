// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 当一个函数被调用后，calldata 的前四个bytes 指定调用哪个函数
// 这四个字节 被称为 function selector
//


contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes) {
        return bytes4(keccak256(bytes(_func)));
    }
}
