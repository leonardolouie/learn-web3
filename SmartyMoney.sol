

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract SmartMoney {
   uint public balanceReceived;

   function deposit() public payable   { 
     balanceReceived +=  msg.value;
   }

   function getContractBalance() public view returns(uint) {
     return address(this).balance;
   }

   function withdrawAll() public { 
    address payable to = payable (msg.sender);
    balanceReceived -= getContractBalance();
    to.transfer(getContractBalance());
   }


   function withAddressToAddress( address payable  to) public  {
    balanceReceived -= getContractBalance();
    to.transfer((getContractBalance()));
   }

   //get all balance and send to sender  if call data is called
   receive() external payable { 
    balanceReceived -= getContractBalance();
    payable(msg.sender).transfer(getContractBalance());
   } 

    
}