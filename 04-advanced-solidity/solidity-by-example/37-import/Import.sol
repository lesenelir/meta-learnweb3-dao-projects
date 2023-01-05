// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Foo.sol';

import {Unauthorized, add as func, Point} from './Foo.sol';

// 引入外部合约
// https://github.com/owner/repo/blob/branch/path/to/Contract.sol
import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

contract Import {
    Foo public foo = new Foo();

    // Test Foo.sol
    function getFooName() public view returns (string memory) {
        return foo.name();
    }

}


