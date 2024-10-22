// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday

contract ExampleWrapAround {
    
   // Integers are numbers without decimals. Unsiged integers cannot be negative.
   //The smallest one is (u)int8 (0 to 2^8-1, or 0 to 255), the biggest one is uint256 (0 to 2^256 - 1, or 0 to a "very large number" 🤔)
   //if you dont need default value dont wirte it, it wall cause computation that cause higher gas
   uint public myUint; // you can use bignumber if 0 - (2^256) - 1 is not enough
   uint8 public myUint8 = 250; // until only 256
   int public myInt= - 10; // - 2 ^ 128 
    
   
   function setMyUint(uint _myUint) public   { 
     myUint = _myUint;
   }

   function decrementMyUint() public   { 
        unchecked {
        myUint--;
        }
   }

   function incrementUint8() public  {
      myUint8++;
   }

   function incrementInt() public { 
     myInt++;
   }

}