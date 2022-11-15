// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.26;

contract LargestOfFourNums {
    function largestOfFour(
        uint num1,
        uint num2,
        uint num3,
        uint num4
    ) public view returns (uint result) {

      assembly {
        let maxA := sub(num1, mul(lt(num1, num2), sub(num1, num2)))
        let maxB := sub(num3, mul(lt(num3, num4), sub(num3, num4)))
        result   := sub(maxA, mul(lt(maxA, maxB), sub(maxA, maxB)))
    
    }
    }
}
