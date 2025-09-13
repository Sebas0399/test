// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
contract EmergencyStop {
    address s_owner;
    bool s_paused = false;
    event Paused(address account);
    event UnPaused(address account);
    event EmergencyWithDraw(address indexed owner, uint amount);
    constructor() {
        s_owner = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == s_owner, "onlyOwner");
        _;
    }
    modifier whenNotPaused() {
        require(!s_paused, "Contrato esta pausado");
        _;
    }
    modifier whenPaused() {
        require(s_paused, "Contrato no esta pausado");
        _;
    }
    function pause() public onlyOwner whenNotPaused {
        s_paused = true;
        emit Paused(msg.sender);
    }
    function unPause() public onlyOwner whenPaused {
        s_paused = false;
        emit UnPaused(msg.sender);
    }
    mapping(address => uint256) private s_balances;
    function deposit() public payable whenNotPaused {
        s_balances[msg.sender] += msg.value;
    }
    function withdraw(uint256 _amount) public whenNotPaused {
        //Check
        require(
            _amount <= s_balances[msg.sender],
            "No tienes fondos suficientes"
        );
        //Efects
        s_balances[msg.sender] -= _amount;
        //payable(msg.sender).transfer(_amount);
        //Call-Interactions

        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Error al enviar los fondos");
    }
    function emergencyWithDraw() public payable onlyOwner whenPaused {
        uint contactBalance = address(this).balance;
        (bool sent, ) = s_owner.call{value: contactBalance}("");
        require(sent,"Error al retirar fondos de emergencia");
        emit EmergencyWithDraw(s_owner, contactBalance);
    }
}
