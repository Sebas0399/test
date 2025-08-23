// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Repaso {
    string public nombreAlmacenado;

    constructor() {
        nombreAlmacenado = "perfecto";
    }

    function compararNombres(string memory _nombreComparar)
        public
        view
        returns (bool)
    {
        return
            keccak256(abi.encodePacked(nombreAlmacenado)) ==
            keccak256(abi.encodePacked(_nombreComparar));
    }

    function estaVacio(uint256 a) public view returns (uint256 a_) {
        a_ = a;
    }

    function estaVacio() public view returns (bool b) {
        b = bytes(nombreAlmacenado).length == 0;
    }
}
