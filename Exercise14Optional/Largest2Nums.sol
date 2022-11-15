// SPDX-License-Identifier: GPL-3.0 

pragma solidity ^0.4.26;

contract LargestOfTwoNums {

    function largestOfTwo(uint num1, uint num2) public view returns(uint result){

           assembly{
            jumpi(num1Greater, gt(num1, num2))
            jump(num2Greater)

            num1Greater:
                result := num1
                jump(end)
            num2Greater:
                result := num2
            end:
        }

    }


    
}