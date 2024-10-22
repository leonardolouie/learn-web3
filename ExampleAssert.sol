

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleAssert {
     

     mapping (address => uint8) public balanceRecieved;


      function receivedMoney() public payable { 
          assert(msg.value == uint8(msg.value));
          balanceRecieved[msg.sender] += uint8(msg.value);
      }
    

      function withdrawMoney(address payable _to, uint8 _amount) public  { 
        require(_amount <= balanceRecieved[msg.sender],"Not enough funds, aborting!");
        balanceRecieved[msg.sender] = _amount;
        _to.transfer(_amount);
      }

      
}