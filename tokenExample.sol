// SPDX-License-Identifier: (c) Copyright 2020 Kingsland University, All Rights Reserved.
pragma solidity >=0.4.16 <0.9.0;

contract MyToken {
    mapping(address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}
