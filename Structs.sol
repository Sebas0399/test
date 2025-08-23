// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Structs {
    struct Student {
        string Name;
        uint256 age;
        bool isMale;
    }

    Student student = Student("Antony", 20, true);
    Student[] public students;

    /*function getStudent() public view returns (Student memory) {
        return student;
    }*/

    function getStudent(uint256 _i) public view returns (Student memory) {
        return students[_i];
    }

    /*function setStudente(Student memory nuevoStudent) public{
        student = nuevoStudent;
    }*/
    function setStudente() public {
        students.push(Student("Juan", 20, true));
    }
}
