// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

contract SimpleTimedAuction2 {
    address public owner;
    uint256 maxTokens;
    uint256 startBlock = block.number;
    uint256 expirationTime = startBlock + 1;
    uint256 ethFromWei;
    uint256 tokenAmount;

    mapping(address => uint256) totalContribution; // in ether
    mapping(address => uint256) balances; // in token amount

    event TokensBought(address purchasedFrom, uint256 amountOfTokensBought);

    constructor(uint256 _maxTokens) {
        owner = msg.sender;
        maxTokens = _maxTokens;
    }

    function buyTokens() public payable returns (uint256) {
        // conversions for mapping etc
        ethFromWei = msg.value / 1000000000000000000;
        tokenAmount = ethFromWei * 2;

        // requirements
        require(expirationTime >= block.number, "Auction has ended!");
        require(msg.value > 0.5 ether, "Must send more than 0.5 ether");

        //couldn't get this to throw my error message???????
        require((maxTokens - tokenAmount) >= 0, "Cannot sell more than total tokens");

        // add contributions/balances
        balances[msg.sender] += tokenAmount;
        totalContribution[msg.sender] += ethFromWei;

        // fire event
        emit TokensBought(msg.sender, tokenAmount);

        //subtract maxToken amount
        maxTokens -= tokenAmount;

        return (tokenAmount);
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    function getTotalContribution() public view returns (uint256) {
        return totalContribution[msg.sender];
    }

    function getTokensRemainingToSell() public view returns (uint256) {
        return maxTokens;
    }

    function getCurrentBlock() public view returns(uint){
        return block.number;
    }
}
