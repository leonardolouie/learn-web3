

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleExeceptionRequire {
     

     mapping (address => uint) public balanceRecieved;


      function receivedMoney() public payable { 
          balanceRecieved[msg.sender] = msg.value;
      }
    

    // If is not enought to prompt the msg.sender on the contract
    //   function withdrawMoney(address payable _to, uint _amount) public  { 
    //     if(_amount <= balanceRecieved[msg.sender]) { 
    //         balanceRecieved[msg.sender] = _amount;
    //         _to.transfer(_amount);
    //     }
    //   }

      function withdrawMoney(address payable _to, uint _amount) public  { 
        require(_amount <= balanceRecieved[msg.sender],"Not enough funds, aborting!");
        balanceRecieved[msg.sender] = _amount;
        _to.transfer(_amount);
      }

}