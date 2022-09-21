// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 导入ERC-20标准 from OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

// LW3合约是继承于ERC20合约（导入的标准合约）
// ERC20合约中的所有public、external、internal的方法和逻辑都可以在子合约中使用
contract LW3Token is ERC20 {
    // LW3Token合约第一次部署会调用constructor方法
    // LW3Token合约第一次部署需要用户的两个参数：_name 和 _symbol（代币全称、代币别名）
    // LW3Token合约 执行构造函数后 立即调用 ERC20的构造函数，将用户输入的两个参数传递给ERC20合约构造函数
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        // _mint()函数是ERC20的internal函数，只允许自己和子合约调用
        _mint(msg.sender, 10 * 10 ** 18);
    }
}

