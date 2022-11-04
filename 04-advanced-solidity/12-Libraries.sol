// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Libraries cannot contain any state variables, and can not transfer ETH
// add helper function to the contract
library SafeMath {
    function add(uint x, uint y) internal pure returns (uint) {
        uint z = x + y;
        // if z overflowed, throw an error
        require(z >= x, 'uint overflow');
        return z;
    }
}


contract TestSafeMath {
    function testAdd(uint x, uint y) public pure returns (uint) {
        return SafeMath.add(x, y);
    }
}

