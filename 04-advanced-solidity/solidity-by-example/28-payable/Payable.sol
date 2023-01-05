// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    // function 和 address 定义为 payable 则可以接收 ether至合约

    // 可接收ether的地址
    address payable public owner;

    // 可接收ether的构造函数
    constructor() payable {
        owner = payable(msg.sender);
    }

    // 将ether存入合约的函数
    // 调用该函数 需要一定的ether
    // 该合约的余额会自动更新
    function deposit() public payable {}

    // 调用该函数需要一定的ether
//    function notPayable() public {}

    // 该函数是把 ether 从 合约中撤出
    function withdraw() public {
        // 获得该合约中存储的ether
        uint amount = address(this).balance;

        // 发送所有ether To owner
        // owner 可以接收到ether，因为owner 的地址 是 payable
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // 该函数 把 ether 从该合约 转入input address
    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

}
