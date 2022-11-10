// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract IntegerOverflow {

    uint8 balance;

    // uint 8 is 1 byte can only store 255. 
    // try sending 250 and check balance
    // then send 10 and check balance

    // use safemath by openzeppelin or
    // add require statement to check balance of to + msg.value >= msg.value

    function send() public payable{
        balance += uint8(msg.value);
    }
    
    function get() public view returns(uint8){
        return balance;
    }
}