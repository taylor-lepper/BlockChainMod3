// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;




interface Token{

    function totalSupply() external view returns (uint256 supply);

 
    function balanceOf(address _owner) external view returns(uint256 balance);



    function allowance(address _owner, address _spender) external view returns (uint256 remaining);


    function transferFrom(address _from, address _to, uint256 _value) external returns (bool didOperationSucceed);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 _value);
}