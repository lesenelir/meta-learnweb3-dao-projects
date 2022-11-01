// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 枚举类型
// 定义类型，包含成员
// 通常去限制一些变量去包含一些预先设定的值

contract Enum {
    // Enum representing different possible states
    enum Status {
        Pending,  // 0
        Shipped,  // 1
        Accepted, // 2
        Rejected, // 3
        Canceled  // 4
    }

    // Declare a variable of the type Status
    Status public status;

    // 枚举内部是由uint定义的
    // get function return a unit
    function get() public view returns (Status) {
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    // Update value to a specific enum members
    function cancel() public {
        status = Status.Canceled;
    }
}
