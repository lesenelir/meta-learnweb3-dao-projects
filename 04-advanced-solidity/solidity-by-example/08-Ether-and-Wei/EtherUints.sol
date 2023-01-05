// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherUints {
    // 每笔交易都是以Ether来做为交易媒介

    // 1 Eth = 10 ** 18 Wei

    uint public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = oneWei == 1; // true

    uint public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    bool public isOneEther = 1 ether == 1e18; // true
}
