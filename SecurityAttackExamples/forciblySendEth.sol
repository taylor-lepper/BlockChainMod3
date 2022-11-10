// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.5.0;

contract Vulnerable {
    // fix is here
    address owner;
    bool paused;
    constructor ()public{
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

      function pause() public onlyOwner{
        paused = true;
    }

    // end fix besides one line of require in somethingBad()

    function () external payable{
        revert();
    }

  
    function somethingBad() public{
        //require(!paused);
        require(address(this).balance > 0);
        // Do something bad
    }
}

contract Hacker {
    Vulnerable vulnerable;

    constructor(Vulnerable v) public payable{
        vulnerable = v;
    }

    function destroy() public payable{
        selfdestruct(address(vulnerable));
    }

    function notWorkingSend() public payable{
        require(address(vulnerable).send(msg.value));
    }
}