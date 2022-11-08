// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract PureFunctions {

    uint data; 


    function ethToWei(uint eth) pure public returns (uint){
        return eth * 1000000000000000000;
    }

    function calcTriangleArea(int width, int height) pure public returns (int){
        return width * height/2;
    }


    //these go together

    function calculate(uint a, uint b) pure public returns(uint){
        return a * b;
    }


    function persist(uint a, uint b) public{
       data += calculate(a,b); 
    }

    function get() public view returns(uint){
        return data;
    }



}
