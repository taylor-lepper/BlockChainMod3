// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract BillPayer {

    address payable public owner;

    event MoneyReceived(address sender, uint amount);
    event MoneyPaid(address recepient, uint amount);

    constructor() payable public{
        owner = payable(msg.sender);
        emit MoneyReceived(msg.sender, msg.value);
    }

    function receiveEth() payable external{
        emit MoneyReceived(msg.sender, msg.value);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function payBill(uint amount) public payable {
        //ToDo: check the bill sender and amount before the payment!!

        msg.sender.transfer(amount);
        emit MoneyPaid(msg.sender, amount);
    }
}