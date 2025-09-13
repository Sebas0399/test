// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract SimpleToken {
    string public name;
    string public symbol;
    uint public  initialSuply;
    uint public  totalSuply;
    address public  owner;
    mapping (address => uint) public balances;
    event Transfer(address indexed  from,address indexed to, uint value);
    constructor(string memory _name,string memory _symbol, uint _initialSuply){
        name=_name;
        symbol=_symbol;
        initialSuply=_initialSuply;
        balances[msg.sender]=_initialSuply;
        owner=msg.sender;
    }
    function transfer (address _to,uint _amount) public  returns  (bool){
        //C
        require(balances[msg.sender]>=_amount,"Insufficient Balance");
        //E
        balances[msg.sender]-=_amount;
        balances[_to]+=_amount;
        emit Transfer(msg.sender,_to,_amount);
        return true;
    }
}