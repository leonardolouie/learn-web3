



// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.26;


contract SmartConractWallet { 
   
   address payable public owner;
   mapping (address => uint) public allowance;
   mapping (address => bool) public isAllowedToSend;
   mapping(address => bool) public guardians;
   address payable nextOwner;
   uint public guardiansResetCount;
   uint public  confirmationsFromGuardianResetCount = 3;
   mapping (address => mapping(address => bool)) public nextOwnerGuardianVotedBool; 

   constructor() {
    owner = payable(msg.sender);
   }

   function setAllowance(address payable  _for, uint _amount) public { 
      require(msg.sender == owner, "You are not the owner of the contract cannot do transfer");
      _for.transfer(_amount);
      allowance[_for] += _amount;

      if(_amount > 0) {
          isAllowedToSend[_for] = true;
      } else { 
          isAllowedToSend[_for] = false;
      } 
   }

   function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){  
    require(msg.sender == owner, "You are not the owner of the contract cannot do transfer");
     
    if(msg.sender != owner) {
        require(isAllowedToSend[msg.sender], "You arere not allowed to send to this smart contract, aborting!");
        require(allowance[_to] >= _amount, "You are trying to send more than you are allow, aborting!");

        allowance[_to] -= _amount;
    }
    (bool success, bytes memory returnData) =_to.call{value: _amount}(_payload);
    require(success, "Aborting, call was not sucessful");

    return returnData;
   }

   receive() external payable { }


   function setGuardian(address _guardianAddress, bool _isGuardian) public { 
     require(msg.sender == owner, "You are not the owner of the contract cannot do transfer");
     require(guardians[_guardianAddress] == false, "Guardian already set cannot set again");
     guardians[_guardianAddress] = _isGuardian;
   }


   function proposeNewOwner(address payable newOwner) public {
        require(guardians[msg.sender], "You are no guardian, aborting");
        if(nextOwner != newOwner) {
            nextOwner = newOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;

        if(guardiansResetCount >= confirmationsFromGuardianResetCount) {
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }


}


contract Consumer { 
  function deposit() public  payable  { 
  }
}

