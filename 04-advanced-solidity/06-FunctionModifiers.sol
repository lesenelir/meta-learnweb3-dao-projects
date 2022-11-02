// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// run before or after a function call
contract Modifiers {
    // state variable
    address public owner;

    constructor() {
        // set the contract developer as the owner of the contract
        // msg.sender => contract caller
        owner = msg.sender;
    }

    // create a modifier that only allows a function to be called by the owner
    modifier onlyOwner() {
        require(msg.sender == owner, 'You are not the owner');
        // _ 是在modifier的一个关键字，表示用来执行函数的执行
        _;
        // 由此可以得出，在函数调用前执行require检查，再执行相关函数
    }

    // create a function and apply the onlyOwner modifier
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}

// modifiers can do:
// - Restricting access to certain functions
// - Validating input parameters
// - Protecting against certain types of attacks
