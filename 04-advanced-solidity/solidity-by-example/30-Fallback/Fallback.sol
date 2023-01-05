// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fallback {
    // fallback() 是一个函数，该函数没有参数，也没有返回值
    // fallback()执行的情况：
    // - 一个不存在的函数被调用
    // - Ether是直接send 到合约中 但 receive函数 并不存在 或者 msg.data 不为空

    event Log(uint gas);

    // Fallback 必须声明为 external （给外部合约调用）
    fallback() external payable {
        emit Log(gasleft());
    }

    // Helper function to check 合约的余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}


contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

