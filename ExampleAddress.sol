
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleAddress {
  address public someAddress; //20bytes

   
   function setSomeAddress(address _someAddress) public { 
     someAddress = _someAddress;
   }
    
    function getAddressBalance () public view returns(uint) { 
        return someAddress.balance; // 1 ETH  = 10 ^ 18 wei
    }
   
}