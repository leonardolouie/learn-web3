

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; //latest version of soliday


contract SampleFallBack { 

    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;


    //call data is calling function in EVM byt encoded value (a low-level code that is executed by the EVM when a contract is run)
    // this function this is the evem code 0xe492fd840000000000000000000000000000000000000000000000000000000000000001
    // 0xe492fd84 - function
    // 0000000000000000000000000000000000000000000000000000000000000001 - input
    function setMyUint(uint _myUnit) public { 
      myUint= _myUnit;
    }

    receive() external payable { 
        lastValueSent = msg.value;
        lastFunctionCalled="received";
    }

    // this serve as a fallback when there is no call data function is set either received
    fallback() external payable  {
      lastValueSent = msg.value;
      lastFunctionCalled = "fallback";
    }
}