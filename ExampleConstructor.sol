
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleConstructor {

  address public myAddress;

  constructor(address _someAddress){ //before deploying the contract this is needed
    myAddress = _someAddress;
  }

  function setMyAddress(address _myAddress) public {
     myAddress = _myAddress;
  }
  
  function setMyAddressToMsgSender() public { 
    myAddress = msg.sender;
  }
 
}