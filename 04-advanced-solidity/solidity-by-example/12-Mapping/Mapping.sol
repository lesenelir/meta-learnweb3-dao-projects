// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {
    // mapping (keyType => valueType)
    // keyType 可以是任意内置类型，bytes、string、contract
    // valueType 可以是任意类型，可以包含 另一个mapping or Array

    // mapping : from address to uint
    mapping(address => uint) public myMap;

    function get(address _addr) public view returns (uint) {
        // Mapping returns a value
        // 如果value值没有被设置，则该value值为默认值
        return myMap[_addr];
    }

    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }

}


contract NestedMapping {
    // Nested mapping （mapping: from address to 另一个mapping ）
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr1, uint _i) public view returns (bool) {
        // nested mapping，key是一个地址，value是一个mapping
        // nested[_addr1] 也是一个mapping，key是uint，值是bool
        return nested[_addr1][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }

}


