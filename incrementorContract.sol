pragma solidity >=0.7.0 <0.9.0;

contract Incrementor {
    uint256 private value;

    function increment(uint256 delta) public {
        value += delta;
    }

    function get() public view returns (uint256) {
        return value;
    }
}
