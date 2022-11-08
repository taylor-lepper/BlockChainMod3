// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Owned {
    constructor() public payable {owner = msg.sender;}
    address payable owner;
}

contract Terminatable is Owned{
    function terminate() public {
        require (msg.sender == owner);
        selfdestruct(owner);
    }
}