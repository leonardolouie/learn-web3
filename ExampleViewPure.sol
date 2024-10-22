
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleViewPure {
  
  uint public myStorageVariable = 10;
   

   function getMyStorageVariable() public view returns(uint) {
     return myStorageVariable;
   }

     function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b;
    }

   function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar; // this is wrong cause when u are dealing with the blockchain it needs to be mined for sometime
    }


}