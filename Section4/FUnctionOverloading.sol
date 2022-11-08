// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract FunctionOverloading{

    //functions with same names but different input/output
    
    function main(uint a) public pure returns(uint){
        return a;
    }

    function main(uint a, uint b) public pure returns (uint){
       return a + b;
    }
}