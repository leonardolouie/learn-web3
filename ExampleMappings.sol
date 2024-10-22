// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleMapping { 
  
  // key => value
  mapping(uint => bool) public myMapping;
  mapping (address => bool) public myAddressMapping;
  mapping (string => address) public myAddressListMapping;
  mapping (uint => mapping(uint => bool)) public myUintUintBoolMapping;
  
  function setValue(uint _index) public{
    myMapping[_index] = true;
  }


  function setMyAddressToTrue() public { 
    myAddressMapping[msg.sender] = true;
  }

   function setMyAddressToFalse() public { 
    myAddressMapping[msg.sender] = false;
  }

  function setMyAddressListVal(string memory _addressName) public { 
    myAddressListMapping[_addressName] = msg.sender;
  }

  function setMyUintUintBoolvalue(uint _key1, uint _key2, bool _value) public {
   myUintUintBoolMapping[_key1][_key2] = _value;
  }
  
}