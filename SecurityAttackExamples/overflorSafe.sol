// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;


library SafeMath {

    function add(uint8 a, uint8 b) internal pure returns(uint8) {
        uint8 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint8 a, uint8 b) internal pure returns(uint8) {
        require(b >= a, "SafeMath: subtraction overflow");
        uint8 c = a - b;

        return c;
    }

     function mul(uint8 a, uint8 b) internal pure returns(uint8) {
        if(a ==0){
            return 0;
        }

        uint8 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint8 a, uint8 b) internal pure returns(uint8){
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint8 c = a / b;
        // asser(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

      function mod(uint8 a, uint8 b) internal pure returns(uint8) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}
contract SafeOverflow {

    using SafeMath for uint8;

    uint8 balance;

    function send() public payable{
        balance = balance.add(uint8(msg.value));
    }

    function get() public view returns(uint8){
        return balance;
    }
}