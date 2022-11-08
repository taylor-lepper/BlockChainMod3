// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract Token1000{
    mapping(address => uint) public balances;


    constructor() payable {
        balances[msg.sender] += 1000 * msg.value;
    }
}