// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gas {
    uint public i = 0;

    // 使用所有gas，直至交易失败
    function forever() public {
        // 修改state变量需要支付transaction交易手续费用
        // 此处循环，花费所有gas spent（个数），直至没有
        // 随后交易失败
        while (true) {
            i += 1;
        }
    }

}
