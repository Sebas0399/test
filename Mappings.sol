// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Mapping{

    mapping (address =>uint) public myMapping;
    //get
    //set
    //delete
    function get(address _addresss)public  view returns (uint){
        return myMapping[_addresss];
    }
    function set(address _address, uint _value) public {
        myMapping[_address] = _value;
    }
}