// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Constant{

    uint constant answer = 42;

    function get() public view returns(uint){
        return answer;
    }

    //cannot assign to a constant variable error below
   
   
    function set(uint a) public{
        answer= a;
    }
}