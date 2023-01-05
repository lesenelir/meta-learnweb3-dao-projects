// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todos {
    // struct 可以定义属于自己的类型
    // struct 和 enum 可以定义在合约外部，也可以通过import 引入别的合约的struct

    struct Todo {
        string text;
        bool completed;
    }

    // structTodo类型的数组
    Todo[] public todos;

    function create(string calldata _text) public {
        // 初始化struct类型变量

        // 1. 以函数的方式调用
        todos.push(Todo(_text, false));

        // 2. key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // 3. 初始化一个空struct变量 并更新
        Todo memory todo;
        todo.text = _text;
        todo.completed = false;
        todos.push(todo);
    }

    // 当用struct 声明类型的变量，solidity 自动创建 该类型变量的getter方法
    // 所以实际上不需要以下这个get函数
    function get(uint _index) public view returns (string memory text, bool completed) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    // update text
    function updateText(uint _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }


}
