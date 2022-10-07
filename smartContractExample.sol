// SPDX-License-Identifier: (c) Copyright 2020 Kingsland University, All Rights Reserved.

pragma solidity >=0.4.16 <0.9.0;

contract Greeter {
    string greeting;

    constructor(string memory _greeting) {
        greeting = _greeting;
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}
