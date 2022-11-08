// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.16;

contract PetAdoption {
    address public owner;
    uint256 public adoptionTime;

    // comparison variables

    string male = "male";
    string male2 = "MALE";
    string male3 = "Male";
    string dog = "dog";
    string fish = "fish";
    string cat = "cat";

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    struct Animal {
        string breed;
        string gender;
        uint256 adoptionTime;
    }

    string[] public shelter;

    mapping(address => bool) adoptedMapping;
    mapping(address => Animal) animalMapping;

    function add(string memory _breed, uint256 _qty) public onlyOwner {
        for (uint256 i = 0; i < _qty; i++) {
            shelter.push(_breed);
        }
    }

    function adopt(
        uint256 personAge,
        string memory personGender,
        string memory animalBreed,
        string memory animalGender
    ) public {
        require(
            adoptedMapping[msg.sender] != true,
            "You can only adopt one animal"
        );

        //male
        if (
            keccak256(abi.encodePacked(personGender)) ==
            keccak256(abi.encodePacked(male)) ||
            (keccak256(abi.encodePacked(personGender)) ==
                keccak256(abi.encodePacked(male2)) ||
                (keccak256(abi.encodePacked(personGender)) ==
                    keccak256(abi.encodePacked(male3))))
        ) {
            //make sure they chose dog or fish
            require(
                keccak256(abi.encodePacked(animalBreed)) ==
                    keccak256(abi.encodePacked(dog)) ||
                    (keccak256(abi.encodePacked(animalBreed)) ==
                        keccak256(abi.encodePacked(fish))),
                "Must choose a dog or fish!"
            );

            // create animal for mapping
            Animal memory newAnimal = Animal({
                breed: animalBreed,
                gender: animalGender,
                adoptionTime: block.timestamp
            });

            animalMapping[msg.sender] = newAnimal;
            adoptedMapping[msg.sender] = true;
        } else {
            //female
            if (personAge < 40) {
                // no cats if under 40
                require(
                    keccak256(abi.encodePacked(animalBreed)) !=
                        keccak256(abi.encodePacked(cat)),
                    "You are not old enough to be a cat lady, select another animal type"
                );

                // create animal for mapping
                Animal memory newAnimal = Animal({
                    breed: animalBreed,
                    gender: animalGender,
                    adoptionTime: block.timestamp
                });

                animalMapping[msg.sender] = newAnimal;
                adoptedMapping[msg.sender] = true;
            } else {
                // create animal for mapping
                Animal memory newAnimal = Animal({
                    breed: animalBreed,
                    gender: animalGender,
                    adoptionTime: block.timestamp
                });

                animalMapping[msg.sender] = newAnimal;
                adoptedMapping[msg.sender] = true;
            }
        }
    }

    function returnAnimalToShelter() public {
        require(
            adoptedMapping[msg.sender] == true,
            "You don't have any animals to return!"
        );
        uint256 _adoptionTime = animalMapping[msg.sender].adoptionTime;
        
            require(
                _adoptionTime + 1 minutes >= block.timestamp,
                "You only have 1 minute for animal returns!"
            );
        

        delete adoptedMapping[msg.sender];
        delete animalMapping[msg.sender];
    }

    function getAnimalsFromShelter() public view returns (string[] memory) {
        return shelter;
    }

    function hasAdoptedBefore() public view returns (bool) {
        return adoptedMapping[msg.sender];
        // return animalMapping[msg.sender].gender;
    }
}
