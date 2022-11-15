// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.26;

contract MedianOfArrays {
    function findTheMedian(uint256[] arr) public view returns (uint256) {
        uint256 result;

        assembly {
            let len := mload(arr)
            let halfLen := div(len, 2)
            if eq(mod(len, 2), 1) {
                let medianIndex := add(sub(halfLen, div(1, 2)), 1)

                let dataElementLocation := add(arr, 0x20)

                for {
                    let end := add(dataElementLocation, mul(medianIndex, 0x20))
                } lt(dataElementLocation, end) {
                    dataElementLocation := add(dataElementLocation, 0x20)
                } {
                    result := mload(dataElementLocation)
                }
                 mstore(0x0, result)
                return(0x0,32)
            }
            if eq(mod(len, 2), 0) {
                // evens

                let endingIndex := add(halfLen, 1)
                let startingIndex := sub(halfLen, 1)

                let dataElementLocation := add(arr, 0x20)

                let start := add(dataElementLocation, mul(startingIndex, 0x20))
                let end := add(dataElementLocation, mul(endingIndex, 0x20))

                for {
                    let i := startingIndex
                } lt(i, endingIndex) {
                    i := add(i, 1)
                } {
                    result := add(result, mload(add(add(arr, 0x20), mul(i, 0x20))))
                    
                }
                result := div(result,2)
                mstore(0x0, result)
                return(0x0,32)
            }
        }
    }
}
