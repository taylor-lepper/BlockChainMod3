// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.16 <0.9.0;

contract DealContract {
  address public dealer1;
  address public dealer2;
  bool isDealDone = false;

  constructor(address d1, address d2) public {
      dealer1 = d1;
      dealer2 = d2;
  }

  function doDeal() public view{
      require(msg.sender == dealer1 || msg.sender == dealer2, "unauthorized deal");
  }
}

contract DealFactory {
    DealContract[] deals;

    function createNewDeal(address d1, address d2) public {
       deals.push(new DealContract(d1, d2));
    }

    function getDeals() public view returns (DealContract[] memory){
        return deals;
    }
}