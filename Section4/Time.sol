// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Time{

    function fiveEthers() public pure returns (uint){
        return 5 ether;
    }

    function timeAfter5Mins() public view returns (uint){
        return block.timestamp + 5 minutes;
    }

    function f(uint start, uint daysAfter) public view {
        if(block.timestamp >= start + daysAfter * 1 days) {
            // check to see if its been a month since contract was created, and 
            // then you can allow or not allow it to be executed
        }
    }
}