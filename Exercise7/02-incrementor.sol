//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract incrementors {

    uint ogValue;

    function get() view public returns (uint){
        return ogValue;
    }

    function increment(uint delta) public {
        ogValue += delta;    
    }
}