// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Example {
    uint private val;
    constructor(uint initVal) public {val = initVal;}
    function add(uint amount) public {val += amount;}
    function get() public view returns (uint) {return val;}
}

contract User {
    Example e = new Example(100).value(5000)(10);
    function getExampleAddr() public view returns (address){
        return address(e);
    }

    function getExampleVal() public view returns (uint){
        return e.get();
    }
}