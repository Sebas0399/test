// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.17;
contract Trnasfer{
    address payable owner;
    constructor(){
        owner=payable(msg.sender);
    }
    function transferir () public {
        //comdicional
        require(msg.sender==owner,"rata");
        //call
        (bool succes, )=owner.call{value: address(this).balance}("");
        require(succes,"ta mal");
        /*
        .this (referencia al contrato)
        adress(.this) refrencia a la direccion del contrato
        .balance -- cantidad de ether del contrato
        */
    }

      function trasnfer () public {
        //comdicional
        require(msg.sender==owner,"rata");
        //call
        owner.transfer(address(this).balance);
      
        /*
        .this (referencia al contrato)
        adress(.this) refrencia a la direccion del contrato
        .balance -- cantidad de ether del contrato
        */
    }
}