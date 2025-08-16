// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
contract Modifier{
      address payable owner;
    constructor(){
        owner=payable(msg.sender);
    }
    modifier onlyOwner(){
        require(msg.sender==owner,'Not owner');
        _;
    }
    function get(uint x, uint y) public onlyOwner{

        x*y;
    }
    function trasnfer () public onlyOwner{
        
        //comdicional        //call
        owner.transfer(address(this).balance);
      
        /*
        .this (referencia al contrato)
        adress(.this) refrencia a la direccion del contrato
        .balance -- cantidad de ether del contrato
        */
    }
    //Virtual Permite que hereden la funcion
    function hacerAlgo(uint a,uint b)external pure virtual  returns (uint){
        return a*b;
    }
}

contract newContrato is Modifier {

    function hacerAlgo(uint a,uint b)external pure override returns (uint){
        
        return a+b;
    }
}