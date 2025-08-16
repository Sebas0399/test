// SPDX-License-Identifier: GPL-3.0
pragma solidity  ^0.8.17;

contract EjemploPureView {

    uint public numeroAlmacenado;

    constructor() {
        numeroAlmacenado = 100;
    }

    /// @notice Función PURE: Solo opera con sus parámetros
    function sumar(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    /// @notice Función VIEW: Lee estado pero no lo modifica
    function multiplicar(uint a) public view returns (uint) {
        return numeroAlmacenado * a;
    }

    /// @notice Función normal (no es ni pure ni view)
    function actualizarNumero(uint nuevoNumero) public {
        numeroAlmacenado = nuevoNumero;
    }
    //Payable
    //Comnvertir una address (Hacer un cast para recibir ehter)
    address payable direction; //La address debe ser payable para mover dinero

}