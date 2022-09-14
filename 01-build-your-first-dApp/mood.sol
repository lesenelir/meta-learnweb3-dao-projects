// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

contract MoodDiary {
    string mood;

    // 写函数，修改state变量
    function setMood(string memory _mood) public {
        mood = _mood;
    }

    // 读函数，从blockchain读取数据
    function getMood() public view returns(string memory) {
        return mood;
    }

}

