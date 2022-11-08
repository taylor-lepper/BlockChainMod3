// SPDX-License-Identifier: GPL-3.0



// I figured out about half of this one and it got a little heavy! 

pragma solidity ^0.8.16;

contract HungerGames {
    enum Districts {
        District1, District2, District3, District4, District5, District6, District7, District8, District9, District10, District11, District12
    }
    
  enum Gender {
        Male, Female
    }
    enum Status{
        Alive, Dead
    }

     Status constant defaultChoice = Status.Alive;

    struct Person {
        string name;
        uint8 age;
        Districts district;
        Gender gender;
        Status status;
            }
  
    Person[] players;
    Person currentSoonToBeDeadPerson;





// main functions below 



// register new player to die

    function registerTribute(string memory _name, uint8 _age, Districts _district, Gender _gender, Status _status) public {
        
        require(_age >= 13 && _age <=18, "You must be between 13 and 18 to play the death game");
        require(resolveDistrict(_district) == true, "Must be in a value district in format '0' for District1,  '1' for District2 etc");

        // currentSoonToBeDeadPerson = Person(_name, _age, _district, _gender, _status);
        players.push(Person(_name, _age, _district, _gender, _status));
    }

function commence() public {
    uint256 end = block.timestamp + 5 minutes;
    uint256 lastKill;

    if(block.timestamp < end){
        require(block.timestamp - lastKill > 30 seconds, "Not ready to kill yet.");
        //kill them
        killPerson(0);
        removePlayer(0);
        lastKill = block.timestamp;
    } else{
        return;
    }
    
}





// helper functions below

    
    // how to kill them with code

    function killPerson(uint8 index) public {
    players[index].status = Status.Dead;
  }

  function removePlayer (uint8 index) public{
          for(uint i = index; i < players.length-1; i++){
      players[i] = players[i+1];      
    }
    players.pop();
  }

    // return array of players
    function playersReady() public view returns(Person[] memory){
        return players;
    }

    // check if you in the district
function resolveDistrict(Districts _district) public pure returns (bool) {
    if (_district == Districts.District1)
            return true;
    else if (_district == Districts.District2)
        return true;
    else if (_district == Districts.District3)
         return true;
    else if (_district ==Districts.District4)
          return true;
    else if (_district == Districts.District5) {
           return true;
    }
       else if (_district == Districts.District6) {
           return true;
    }
    else if (_district == Districts.District7) {
            return true;
    }
    else if (_district == Districts.District8) {
           return true;
    }
       else if (_district ==Districts.District9)
          return true;
    else if (_district == Districts.District10) {
           return true;
    }
    else if (_district == Districts.District11) {
            return true;
    }
    else if (_district == Districts.District12) {
           return true;
    }
    else {
       return false;
    }
}

}