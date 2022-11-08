// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract SpecialFunctions{

    function blockCoinbase() public view returns (address) {
        return block.coinbase;
    }

    function blockNumber() public view returns (uint) {
        return block.number;
    }

    function blockTimeStamp() public view returns (uint) {
        return block.timestamp;
    }
    
}