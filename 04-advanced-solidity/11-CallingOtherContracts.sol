// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// just like header files
interface MinimalERC20 {
    // just include the functions we are interested in
    function balanceOf(address account) external view returns (uint256);
}


contract MyContract {
    MinimalERC20 externalContract;

    constructor(address _externalContract) {
        // initialize a minimalERC20 contract instance
        externalContract = MinimalERC20(_externalContract);
    }

    function mustHaveSomeBalance() public {
        uint balance = externalContract.balanceOf(msg.sender);
        require(balance > 0, "You dont own any tokens of external contract");
    }
}

