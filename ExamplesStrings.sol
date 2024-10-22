
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleStrings {
  
  string public myString = "Hello World"; // is not advisable to use this
  bytes public myBytes = unicode"Hello Wörld";

  function setMyString(string memory _myString) public { 
    myString = _myString;
  }
  
  function compareTwoStringS(string memory _myString) public view returns(bool) { 
    return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString)); // strings are not stored as string were just comparing hashes now
  }

   function getBytesLength() public view returns(uint) {
        return myBytes.length;
    }
}