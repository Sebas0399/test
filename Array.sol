// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Array {
    //dynamic array
    uint256[] public arr;
    uint256[] public arr1 = [1, 2, 3, 4, 5, 6];
    uint256[10] public arr2;

    //anadir elementos al final
    function agregar(uint256 _number) public {
        arr.push(_number);
    }

    //get
    function getArray() public  view returns (uint[] memory){
        return  arr;
    }
    //borrar el ultimo elemento
    function borrar() public {
        arr.pop();
    }
    //len
    function tam() public view returns (uint){
        return arr.length;
    }
    //borrar de acuerdo al indice
    function eliminarInd(uint i)public {
        delete arr[i];
    }

    function examples() public  pure{
        uint256[] memory a=new uint256[](5);
    }
}
