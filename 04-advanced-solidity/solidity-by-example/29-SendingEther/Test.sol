// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Which function is called, fallback() or receive()?

       send Ether
           |
     msg.data is empty?
          / \
        yes  no
        /     \
receive() exists?  fallback()
     /   \
    yes   no
    /      \
receive()   fallback()
*/

// 接收Ether必须有 receive 或 fallback 中的一个
contract ReceiveEther {
    // receive 接收 则 msg.data 必须为空
    receive() external payable {}

    // fallback 接收 则 msg.data 不为空
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // 这种发送ether 已经不再推荐使用
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // 返回一个bool值 代表 发送是成功还是失败
        bool sent = _to.send(msg.value);
        require(sent, 'Failed to send Ether');
    }

    function sendViaCall(address payable _to) public payable {
        // 返回一个bool值 代表 发送是成功还是失败
        // 目前比较推荐的写法
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, 'Failed to send Ether');
    }

}


