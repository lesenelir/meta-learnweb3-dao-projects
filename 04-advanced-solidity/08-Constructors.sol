// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract X {
    // contract is the first deployed, and then the constructor executed
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

