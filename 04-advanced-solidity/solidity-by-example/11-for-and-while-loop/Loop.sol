// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Loop {

    function loop() public {
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                continue;
            }
            if (i == 5) {
                break;
            }
        }

    }

    // while loop 和 do while 很少使用
    // while 循环 和 do while 循环 显示上没有边界，可能调用state变量，导致花费手续费，无限调用
    // uint j;
    // while (j < 10) {
    //     j++;
    // }

}
