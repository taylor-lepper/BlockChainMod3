pragma solidity ^0.8.4;

contract Certificates {
    mapping(string => bool) private certificateHashes;
    address contractOwner = msg.sender;

    function add(string memory hash) public {
        require(msg.sender == contractOwner);
        certificateHashes[hash] = true;
    }

    function verify(string memory hash) public view returns (bool) {
        return certificateHashes[hash];
    }
}
