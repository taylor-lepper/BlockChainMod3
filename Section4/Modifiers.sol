// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract OwnerDemo{

    uint  answer;
    address owner;

    constructor() public{
        owner = msg.sender;
    }

    //modifier function to save time and code for repeated functions
    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }

    modifier onlyBy(address addr){
        require(msg.sender == addr);
        _;
    }

    function get() public view returns(uint){
        return answer;
    }
   
   //added into the function after public
    function set(uint a) public onlyOwner{
        answer = a;
    }

    //another way to do it
    function calc8(uint a) public view onlyBy(owner) returns (uint){
        return a * 8;
    }
}