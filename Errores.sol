// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
contract Errores{
    //require - revert - assert

    function tesRequire(uint _x) public pure{
        require(_x>10,'x debe ser mayor que 10');

    }
    function testRevert(uint _x)public pure{
        if(_x <=10){
            revert('x debe ser mayor que 10');
        }
    } 
    //assert
    uint public num = 10;
    function testAssert() public view {
        assert(num == 10);
    }
    uint public balanceContrato=100; //100 eth
    //Errores personalizados
    error SaldoInsuficiente(uint monto,address user,string detalle);

    error ErrorPersonalizado();
    function retirar(uint _montoRetirar)public  view{
        if(balanceContrato < _montoRetirar){
            revert SaldoInsuficiente({monto:_montoRetirar,user:msg.sender,detalle: "No existe el saldo"});
        }
    }

}