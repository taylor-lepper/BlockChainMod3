//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract SimpleStorage{
    //contract body
    //define integer data storage field named storedData
     uint private storedData;

     //function to assign a value in the data storage field

     function set(uint x) public {
         storedData = x;
     }

     //function to read current value from data storage field on the blockchain
     function get() view public returns(uint) {
         return storedData;
     }
     

}