// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Foo.sol';

contract Import {
    // Initialize Foo.sol
    // foo is instance of the Foo's contract
    Foo public foo = new Foo();

    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}

// Note：
//  - 1. when we use Hardhat, we can also install contracts as node modules.This is also the local imports
//  - 2. Import from github by simple URL


