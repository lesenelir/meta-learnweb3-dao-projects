// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // state variables
    // max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    // mapping: address => bool
    // if address is in whitelist, set it to true
    // default value is false, for all addresses
    mapping(address => bool) public whitelistedAddresses;

    // keep track of how many addresses have been in whitelist
    uint8 public numAddressesWhitelisted;

    // contract called to set the max number of whitelisted address
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
        add address of sender to the whitelist
    */
    function addAddressToWhitelist() public {
        // check user whether in whitelisted ?
        require(!whitelistedAddresses[msg.sender], 'Sender has already been whitelisted');
        // check the number of numAddressesWhitelisted < maxWhitelistedAddresses
        require(numAddressesWhitelisted < maxWhitelistedAddresses, 'Limit! No more address can be added!');
        // add address in whitelist
        whitelistedAddresses[msg.sender] = true;
        // increase the num of whitelist addresses
        numAddressesWhitelisted += 1;
    }

}
