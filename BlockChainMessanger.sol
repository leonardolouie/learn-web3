
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract TheBlockChainMessenger {
  
  uint public changeCounter;
  address public owner;
  
  string public theMessage;

   constructor() {
     owner  = msg.sender;
   }

   function updateTheMessage(string memory _newMessage) public payable { 
      if(msg.value == 1 ether) {
          if(msg.sender == owner) {
                  theMessage = _newMessage;
                  changeCounter++;
            }
      } else { 
         payable(msg.sender).transfer(msg.value);
      }
   }
}