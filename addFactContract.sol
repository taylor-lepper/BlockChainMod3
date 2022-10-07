pragma solidity ^0.8.4;

contract Facts {
    string[] private facts;
    address private contractOwner = msg.sender;

    function add(string memory newFact) public {
        require(msg.sender == contractOwner);
        facts.push(newFact);
    }

    function count() public view returns (uint256) {
        return facts.length;
    }

    function getFact(uint256 index) public view returns (string memory) {
        return facts[index];
    }
}
