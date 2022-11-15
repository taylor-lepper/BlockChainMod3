// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.26;

contract CallCounter {
    uint256 callCounter;

    function incrementCount() public {
        assembly {
            let newCount := add(sload(callCounter_slot),1)
            sstore(callCounter_slot, newCount)
        }
    }

    function getCount() public view returns (uint256) {
        assembly {
            mstore(0x0, sload(callCounter_slot))
            return (0x0, 32)
        }
    }
}
