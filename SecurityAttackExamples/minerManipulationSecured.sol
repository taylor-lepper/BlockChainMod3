// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract SomeAssetSecured{
    mapping(address=>uint) balances;

    struct Price{
        uint value;
        uint version;
    }

    Price price;
    address owner;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    // update version everytime similar to databases
    function setPrice(uint p) public onlyOwner{
        price.value = p;
        price.version++;
    }

    function deposit() public payable{
        balances[msg.sender] += msg.value;
    }
    
    // make sure to specify the version you want
    function buy(uint priceVersion) public{
        require(balances[msg.sender] > 0);
        // check here to make sure
        require(priceVersion == price.version);

        balances[msg.sender] -= price.value;
        // TODO: transfer asset
    }

    function withdraw() public{
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        msg.sender.transfer(amount);
    }
}