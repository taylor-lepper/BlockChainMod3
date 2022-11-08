// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

import "StandardToken.sol";

contract LemonToken is StandardToken {
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier hasEnded() {
        require(startTime <= endTime, "Time is up");
        _;
    }

    string public name;
    uint8 public decimals;
    string public symbol;
    uint256 public unitsOneEthCanBuy;
    uint256 public totalRaisedEthInWei;
    address payable public owner;
    uint256 startTime;
    uint256 endTime;
    uint256 contractBalance = address(this).balance;
    address contractAddress = address(this);

    constructor() {
        decimals = 18;
        _totalSupply = 1000000000000000000000000;
        _balances[msg.sender] = _totalSupply;
        name = "LemonToken";
        symbol = "LMN";
        unitsOneEthCanBuy = 100;
        owner = payable(msg.sender);
        startTime = block.timestamp;
        endTime = startTime + 1 hours;
    }

    receive() external payable {
        totalRaisedEthInWei = totalRaisedEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        require(_balances[owner] >= amount);
        _balances[owner] -= amount;
        _balances[msg.sender] += amount;
        emit Transfer(owner, msg.sender, amount);
        owner.transfer(msg.value);
    }

    function withdraw() public payable onlyOwner hasEnded {
        uint256 amount = msg.value;
        require(contractBalance >= amount);
        contractBalance -= amount;
        _balances[owner] += amount;
        emit Transfer(contractAddress, owner, amount);
        owner.transfer(amount);
    }

    function purchaseCoin(uint256 ethAmount) external payable {
        totalRaisedEthInWei += msg.value;
        uint256 amount = ethAmount * unitsOneEthCanBuy;

        emit Transfer(owner, msg.sender, amount);
        owner.transfer(msg.value);

        _totalSupply -= amount;
    }
}
