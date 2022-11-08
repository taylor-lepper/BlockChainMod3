//  SPDX-License-Identifier: GPL-3.0

pragma  solidity >=0.7.0 < 0.9.0;

contract StudentsInfo{

    address owner;
    uint id;
    Student[] public students;


    constructor() {
        owner = msg.sender;
        id = 0;
    }

    struct Student {
        string name;
        address addy;
        uint[] grades;
        uint id;
    }

    Student student;

// sample address  0x32be343b94f860124dc4fee278fdcbd38c102d88 
    function createStudent(string memory _name, address _addy) public{
        require(msg.sender == owner, "Only teachers can add students");
        student.name = _name;
        student.addy = _addy; 
        student.id = id;

        students.push(student);
        id++;
    }

    function setGrade(uint _id, uint grade) public {
        require(msg.sender == owner, "Only teachers can give grades");
        students[_id].grades.push(grade);
    }


    function getStudent(uint index) public view returns (string memory, uint[] memory){
        return (students[index].name, students[index].grades);
    }


}









contract Struct {
    struct Person {
        string firstName;
        string lastName;

    }

    Person person;

    function set(string memory first, string memory last) public{
        person.firstName = first;
        person.lastName = last;
    }

    function get() public view returns (string memory, string memory) {
        return(person.firstName, person.lastName);
    }
}