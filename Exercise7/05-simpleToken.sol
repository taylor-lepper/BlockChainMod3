//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract SimpleTOken{
  mapping (address => uint256) balanceOf;

    constructor(uint256 initialSupply) public{
        balanceOf[msg.sender] = initialSupply;
    }
  

    function transfer(address to, uint256 amount) public{
        require(balanceOf[msg.sender] >= amount);
        require(balanceOf[msg.sender] + amount > balanceOf[msg.sender]);

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }

    function balance() public view returns (uint) {
        return balanceOf[msg.sender];
    }
}