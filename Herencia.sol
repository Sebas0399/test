// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
//contrato padre
contract Padre{
    function foo() public  pure virtual returns  (string memory){
        return "Padre";
    }
}
contract PrimerHijo is Padre{
    function foo() public  pure override  returns (string memory){
        return "PrimerHijo";
    }
}
contract SegundoHijo is Padre{
    function foo() public  pure override virtual  returns (string memory){
        return "SegundoHijo";
    }
}
contract PrimerNiero is Padre,SegundoHijo {
    function foo() public  pure override (Padre,SegundoHijo)  returns (string memory){
        return "SegundoHijo";
    }
}
contract Base {
    uint public s_data;
    constructor(uint _s_data) {
        s_data = _s_data;
    }
    function setData(uint _data) public virtual  {
        s_data = _data;
    }
}

contract Derivado is Base {
    constructor(uint _data) Base (_data){
        s_data=_data;
    }
    function setData(uint _data) public  override  {
        s_data = _data + 10;
    }
}
