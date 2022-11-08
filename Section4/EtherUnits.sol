// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Eth{

    function oneGwei() public pure returns(uint){
        return 1000000000 wei;
    }

    function twoEthers() public pure returns (uint){
        return 2 ether;
    }

}