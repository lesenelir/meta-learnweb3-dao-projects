// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// create a interface for whitelist contract with a function only for this mapping
// 而不是通过合约继承的方式，这也比较省gas fee
interface IWhitelist {
    // whitelist.sol: mapping(address => bool) public whitelistedAddress
    // 可以判断，地址是否在whitelist上
    function whitelistedAddresses(address) external view returns (bool);
}
