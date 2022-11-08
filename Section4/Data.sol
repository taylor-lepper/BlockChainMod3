// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Data{

//gas price examples storage

    uint b;

    // gas = 202054  
    function set(uint val) public{
        b = val;
    }

    // gas = 24078  
    function add(uint a) public view returns (uint){
        return a + b;
    }

    // gas = 21828 
     function added(uint b) public view returns (uint){
        return b;
    }
}