//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract PreviousInvoker{
    address lastInvoker = msg.sender;

    function getLastInvoker() public returns (bool,address){
        address prevInvoker =  lastInvoker;
        lastInvoker = msg.sender;

        return (prevInvoker != address(0x0), prevInvoker);
    }

    event Store (
        address indexed from,
        bytes32 indexed id
    );

    function store (bytes32 id) public {
        emit Store(msg.sender, id);
    }

}