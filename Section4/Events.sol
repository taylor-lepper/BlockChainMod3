// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract Events{

    uint balance;

    event Deposit(address sender, uint amount);

    function deposit(uint amount) public{
        balance += amount;

        //this line adds to log the input parameters etc in trans receipt
        emit Deposit(msg.sender, amount);
    }

    function get() public view returns(uint) {
        return balance;
    }
}