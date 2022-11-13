// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

contract gasOptimizationExamples {
    // dont initialize variables with default values

    uint256 hello = 0; //bad, expensive
    uint256 world; //good, cheap


    // use single line swaps 

  (hello, world) = (world, hello);

  

    // pack 256 bools in 1 slot

    function getBoolean(uint256 _packedBools, uint256 _boolNumber)
        public
        view
        returns (bool)
    {
        uint256 flag = (_packedBools >> _boolNumber) & uint256(1);
        return (flag == 1 ? true : false);
    }

    // set or clear bool

    function setBoolean(
        uint256 _packedBools,
        uint256 _boolNumber,
        bool _value
    ) public view returns (uint256) {
        if (_value) return _packedBools | (uint256(1) << _boolNumber);
        else return _packedBools & ~(uint256(1) << _boolNumber);
    }

    //internal functions are cheaper than public

    //use events to store data that isn't require on-chain rather than storing in variable

    //use libraries to save bytecode
}
