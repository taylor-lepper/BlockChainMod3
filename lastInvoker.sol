pragma solidity >=0.7.0 <0.9.0;

contract LastInvoker {
    address private lastInvoker;

    function getLastInvoker() public returns (bool, address) {
        address result = lastInvoker;
        lastInvoker = msg.sender;
        return (result != address(0x0), result);
    }
}
