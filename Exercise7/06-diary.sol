//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract Diary{
    string[] facts;
    address owner;

     
    constructor(){
        owner = msg.sender;
    }

    function add(string memory fact) public{
        require(msg.sender == owner, "Only owner can add facts");
        facts.push(fact);
    }

    function getFact(uint index) public view returns(string memory){
        require(msg.sender == owner, "Only owners can check authentencity");
        return facts[index];
    }

    function count() public view returns(uint){
        uint length = facts.length;
        return length;
    }
}