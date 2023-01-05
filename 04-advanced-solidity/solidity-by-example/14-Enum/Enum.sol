// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum {
    // solidity支持枚举类型，枚举类型对于model choice 和 跟踪state变量都有作用

    // enum 可以定义在 contract 外

    // 运输状态的枚举
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // 枚举类型本质上就是规定类型的方式
    // 定义一个Status类型的state变量
    Status public status;

    /*
        Pending 0
        Shipped 1
        Accepted 2
        Rejected 3
        Canceled 4
     */

    // 读取当前的枚举类型的变量值
    function get() public view returns (Status) {
        return status;
    }

    // 通过输入数值，更新枚举变量status值
    function set(Status _status) public {
        status = _status;
    }

    // 通过设置特定的值，更新枚举变量status值
    function cancel() public {
        status = Status.Canceled;
    }

    // 重新设置枚举变量的值，重新设置为0
    function reset() public {
        delete status;
    }

}
