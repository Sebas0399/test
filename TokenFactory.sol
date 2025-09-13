// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import "./SimpleToken.sol";
contract TokenFactory{
    //Array para traker de los tokens creados
    SimpleToken[] public deployedTokens;
    //Mapping para ver si un token fue creado con este contrato
    mapping(address => bool) public tokenCreated;
    event TokenCreated(
        address indexed  tokenAddress,
        address indexed creator,
        string name,
        string symbol,
        uint256 totalSupply
    );
    //Funcion para crear un nuevo token
    function createToken(string memory _name, string memory _symbol, uint256 _totalSupply) public returns (address) {
        //Crear nuevo token
        SimpleToken newToken = new SimpleToken(_name, _symbol, _totalSupply);
        //Agregar el token al array
        deployedTokens.push(newToken);
        //Marcar el token como creado
        tokenCreated[address(newToken)]=true;
        emit TokenCreated(address(newToken), msg.sender, _name, _symbol, _totalSupply);
        return address(newToken);
    }
    function getDeployedTokens()public  view returns (uint){
        return deployedTokens.length;
    }
}