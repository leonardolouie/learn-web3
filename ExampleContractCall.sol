

// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.26;


contract ContractOne {


    mapping(address => uint) public addressBalances;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }

    receive() external payable {
        addressBalances[msg.sender] += msg.value;
     }
}

contract ContractTwo {

    function deposit() public payable {}


    // this works if u know the function isnside the contract
    // contract call
    // function depositOnContractOne(address _contractOne) public { 
    //     ContractOne one = ContractOne(_contractOne);
    //     one.deposit{value: 10, gas: 100000}(); 
    // }


    //this on address call contract
    // function depositOnContractOne(address _contractOne) public payable { 
    //      bytes memory payload = abi.encodeWithSignature("deposit()");
    //     (bool success, ) = _contractOne.call{value: 10, gas: 100000}(payload);
    //     require(success);
    // }


   // low level data call which means it would call on received 
   function depositOnContractOne(address _contractOne) public payable { 
        (bool success, ) = _contractOne.call{value: 1 ether, gas: 100000}("");
        require(success);
    }

    
}