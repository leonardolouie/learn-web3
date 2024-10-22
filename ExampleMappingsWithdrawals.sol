// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMappingWithdrawals { 
  
  mapping (address => uint) public addressBalances;
  
  function sendMoney() public  payable {
     addressBalances[msg.sender] += msg.value;
  }

  function getBalance() public view returns(uint){
    return address(this).balance;
  }

  function withdrawAllMoney(address payable _to) public {  
     uint balanceToSendOut = addressBalances[msg.sender];
     addressBalances[msg.sender] = 0;
     _to.transfer(balanceToSendOut);
  }  
}