// SPDX-License-Identifier: GPL-3.0
pragma solidity  ^0.8.17;
//Funciones especiales para enviar ether
contract Fallback {
    //Recordatorio de eventos
    event LogSting(string funcName,address sender,uint amount, bytes data);
    // difrencia de fallback y receive
    fallback() external payable {
        emit LogSting('fallback', msg.sender, msg.value, msg.data);
     }
    //emitir el evento 
    receive() external payable { 
                emit LogSting('receive', msg.sender, msg.value, "");

    }

    
}