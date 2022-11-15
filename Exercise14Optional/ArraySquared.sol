// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.26;

contract ArraySquared{

    function squareTheArray(uint[] arr) public view returns(uint) {
        
        uint result;
        uint length = arr.length;

        assembly{

            for {let i := 0} lt(i, length) {i := add(i, 1)}{
                result := add(result, mul(mload(add(add(arr, 0x20), mul(i, 0x20))), mload(add(add(arr, 0x20), mul(i, 0x20))) ))
            }
   
        mstore(0x0, result)
        return(0x0, 32)
        }
    }
}