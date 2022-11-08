// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

contract Deposit {
    address payable public owner;
    uint public transactionCount;

    constructor(){
        owner = payable(msg.sender);
    }

    mapping (address => uint) balances;

    event Deposited(address indexed payee, uint256 ethAmount);
    event Transfer(address indexed payee, uint256 ethAmount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function deposit(uint _amount) public payable {
        balances[owner] += _amount;
        emit Deposited(msg.sender, _amount);
    }

    
    function readContractBalance() public view returns (uint){
       return balances[owner];
    }

    function transfer(address _to, uint _amount) public payable onlyOwner {
        require(balances[owner] >= _amount);
        balances[owner] -= _amount;
        balances[_to] += _amount;
        owner.transfer(msg.value);

        emit Transfer(_to, _amount);

        //self destruct mechanism
        transactionCount++;
        if(transactionCount >= 5){
            selfdestruct(owner);
        }
    }

    // used to test transfer is working
    function checkBalanceOfAddr(address _addr) public view returns(uint){
        return balances[_addr];
    }

}