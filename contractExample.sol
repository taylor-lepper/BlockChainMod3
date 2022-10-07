//SPDX-License-Identifier: (c) 2020 Kingsland University, All Rights Reserved.
pragma solidity ^0.8.6;

contract MyToken {
/* This creates an array with all balances */
mapping (address => uint256) public balanceOf;
uint256 public totalSupply;

/* Initializes contract with initial supply tokens to the creator of the contract */
constructor() {
totalSupply = 100000;
balanceOf[msg.sender] = totalSupply; // Give the creator all initial tokens
}

/* Send coins */
function transfer(address _to, uint256 _value) public {
    require(balanceOf[msg.sender] >= _value);  //check if the sender has enough
    require(balanceOf[_to] +  _value >= balanceOf[_to ]); //check for overflows
    balanceOf[msg.sender] -= _value; //subtracct from the sender
    balanceOf[_to] += _value;   //add the same to the recipient
}
}