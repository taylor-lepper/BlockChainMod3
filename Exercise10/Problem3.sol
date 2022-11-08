// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

contract SimpleBank {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    mapping(address => uint256) balances;

    event Deposited(address indexed addressPaid, uint256 ethAmount);
    event Withdrawn(address indexed addressPaid, uint256 ethAmount);
   

  function deposit() public payable returns(uint256){
      require(msg.value > 0, "Value for deposit is Zero");
      balances[msg.sender] += msg.value;
      return balances[msg.sender];
  }


  function withdraw(uint _amount) public payable returns(uint256){
      require(balances[msg.sender] > _amount, "insufficeint balance in account");
      require(_amount > 0, "Enter value greater than zero for withdrawal");
      balances[msg.sender] -= _amount;
      payable(msg.sender).transfer(_amount);

      emit Withdrawn(msg.sender, _amount);
      return balances[msg.sender];
  }



    function getBalance() public view returns(uint256){
        return balances[msg.sender];
    }
}
