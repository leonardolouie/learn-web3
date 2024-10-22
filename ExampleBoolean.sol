
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract MyContract {
  bool public myBool;


   function setMybook(bool _myBool) public { 
      myBool = !_myBool;
   }
}