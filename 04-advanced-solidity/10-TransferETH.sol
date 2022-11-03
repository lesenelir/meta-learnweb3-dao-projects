// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// send ETH
// three ways to transfer ETH from a contract to other address
// 目前推荐使用 `call` 函数来进行转账操作
// call function returns a bool value 表明是转账成功还是失败

// receive ETH
// 普通账户会自动接受ETH
// 合约账户 contract account， 合约账户接收ETH至少需要：
//      - receive() external payable
//      - fallback() external payable
//      如果 msg.data为空，则调用receive函数，否则调用fallback函数


contract SendEther {
    // 可支付函数
    function sendEth(address payable _to) public payable {
        uint amountToSend = msg.value;
        // 发送ETH，推荐使用call，返回是否发送成功的bool值
        // call return two things: bool  &  data
        (bool success, bytes memory data) = _to.call{value : msg.value}("");
        require(success == true, 'Failed to send ETH');
    }
}

contract ReceiveEther {
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

    receive() external payable {}

    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}





