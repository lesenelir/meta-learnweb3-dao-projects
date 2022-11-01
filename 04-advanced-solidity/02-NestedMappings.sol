// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedMappings {
    // mapping from address => (mapping from uint => bool)
    mapping(address => mapping(uint => bool)) public nestedMap;

    function get(address _addr1, uint _i) public view returns (bool) {
        // get a value from nestedMap even when it is not initialized
        // the default value for a bool type is false
        return nestedMap[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nestedMap[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nestedMap[_addr1][_i];
    }
}


