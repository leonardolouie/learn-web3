



// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.26;


contract ExampleEvent {
    
    event TokensSent(address indexed _from, address indexed _to, uint _amount);
    mapping(address => uint) public tokenBalance;

  
    constructor() {
      tokenBalance[msg.sender] = 100;
    }

    function sendToken(uint _amount, address _to) public   { 
      require(tokenBalance[msg.sender] >= _amount, "You dont have enough balance to proceed");
      tokenBalance[msg.sender] -= _amount;
      tokenBalance[_to] += _amount;
      emit TokensSent(msg.sender, _to, _amount);
    }
}
