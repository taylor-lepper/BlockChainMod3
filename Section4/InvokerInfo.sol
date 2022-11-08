// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract InvokerInfo {
    address public msgSender;
    address public txOrigin;

    function process() public{
        msgSender = msg.sender;
        txOrigin = tx.origin;
    }
}


contract Invoker{
    function invoke(InvokerInfo info) public {
        info.process();
    }
}