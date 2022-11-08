// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract FallBackFunctions{

    string data;

    function foo(string memory val) public{
        data = val;
    }

    function get() public view returns(string memory){
        return data;
    }
}

contract Invoker {

    function invoke(FallBackFunctions c) public{
        bytes memory bs = abi.encodeWithSignature("foo(string)", "hello");
        address(c).call(bs);
    } 
}