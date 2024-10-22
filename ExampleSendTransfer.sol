

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract Sender { 

    receive() external  payable{}

    function withdrawTransfer(address payable _to) public { 
        _to.transfer(10); // throw an exception or revert when transfer fails
    }

    function withdrawSend(address payable _to) public { 
       bool isSent =  _to.send(10); // will just throw an boolean without failing the transaction
       require(isSent, "Sending the funds was uncessful");
    }
}


contract ReceiverNoAction { 

    receive() external payable { }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}


contract ReceiverAction { 
   uint public balanceReceived;

    receive() external  payable  { 
        balanceReceived += msg.value;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}


