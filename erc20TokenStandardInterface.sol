// SPDX-License-Identifier: (c) Copyright 2020 Kingsland University, All Rights Reserved.

contract ERC20 {
function totalSupply() → uint
function balanceOf(address _owner) → uint
function transfer(address _to, uint _value) → bool
function transferFrom(address _from, address _to, uint _val) → bool
function approve(address _spender, uint _value) → bool
function allowance(address _owner, address _spender) → uint
event Transfer(address _from, address _to, uint _value)
event Approval(address _owner, address _spender, uint _value)
}