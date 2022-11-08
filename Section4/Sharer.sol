// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Sharer {
    function sendHalf(address addr) public payable returns (uint balance){
        require(msg.value % 2 == 0);

        uint balanceBeforeTransfer = this.balance;
        addr.transfer(msg.value/2);

        // since transfer throws an exception on failure and cannot call back here, there
        // should be no way for us to still have half of the money

        assert(this.balance == balanceBeforeTransfer - msg.value / 2);

        return this.balance; 
    }
}