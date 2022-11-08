// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/access/Ownable.sol";

contract SafeMathExample {

    using SafeMath for uint;

    function adding(uint a, uint b) public pure returns (uint){
        return a.add(b);
    }

     function subtracting(uint a, uint b) public pure returns (uint){
        return a.sub(b);
    }

     function multiplying(uint a, uint b) public pure returns (uint){
        return a.mul(b);
    }

}

contract OwnableExample is Ownable{

    address currentOwner;

    constructor(){
        currentOwner = msg.sender;
    }

    // no function needed as it is inherited
}


contract SafeMathImplementation is Ownable{

    using SafeMath for uint256;

    uint256 state;
    uint256 timeSinceLastStateChange = 1;

    function changeState() public onlyOwner {
        if(timeSinceLastStateChange == 1){
            timeSinceLastStateChange = timeSinceLastStateChange - block.timestamp;
        }
        state += block.timestamp % 256;
        state *= timeSinceLastStateChange;
        timeSinceLastStateChange = block.timestamp;

        state -= block.gaslimit;
    }

    function read() public view returns (uint256){
        return state;
    }
}