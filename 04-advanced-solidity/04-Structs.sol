// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TodoList {

    struct TodoItem {
        string text;
        bool completed;
    }

    // Create an array of TodoItem structs
    TodoItem[] public todos;

    function createTodo(string memory _text) public {
        // There are many ways to initialize structs
        // 调用structs结构体的方法

        // 1. Call it like a function
        todos.push(TodoItem(_text, false));

        // 2. Explicitly set its keys
        todos.push(TodoItem({text: _text, completed: false}));

        // 3. Initialize an empty struct, then set individual properties
        TodoItem memory todo;
        todo.text = _text;
        todo.completed = false;
        todos.push(todo);
    }

    // update a struct value
    function update(uint _index, string memory _text) public {
        todos[_index].text = _text;
    }

    // update completed
    function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }

}
