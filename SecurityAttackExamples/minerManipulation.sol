// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract SomeAsset{
    mapping(address=>uint) balances;
    uint price;
    address owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    // owner of smart contract can change price and use higher gas fee while the buy() is pending
    function setPrice(uint p) public onlyOwner{
        price = p;
    }

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
    
    function buy() public{
        require(balances[msg.sender] > 0);

        balances[msg.sender] -= price;
        // TODO: transfer asset
    }

    function withdraw() public{
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        msg.sender.transfer(amount);
    }
}