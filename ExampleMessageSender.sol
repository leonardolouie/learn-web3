
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleMessageSender {

   address public someAddress;

   function updateSomeAddress() public {
    someAddress = msg.sender; //person who interact with smart contract
   }
  
}