// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.6;

contract PseudoRandom {

    bytes32 public randseed;
    address oracleAddress = msg.sender;

    function pseudoRandom (uint start, uint end) public returns (uint){
        randseed = keccak256(abi.encodePacked(randseed, block.timestamp, block.coinbase, block.difficulty, block.number));
        uint range = end - start + 1;
        uint randVal = start + uint256(randseed) % range;
        return randVal;
    }
} 