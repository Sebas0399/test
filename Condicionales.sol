// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Condicionales {
    string public nombreAlmacenado;

    constructor() {
        nombreAlmacenado = "perfecto";
    }

    function condicionales(uint _numero) public pure returns(bool){
        if(_numero==1){
            return true;
        }
        else if(_numero==2){
            return false;
        }
        else {
            return true;
        }
    }
    //Ternarios
        function ternarios(uint _numero)public  pure returns (uint){
            return _numero == 10 ? 1 : 2;
        }

    
}
