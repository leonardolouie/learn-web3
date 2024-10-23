//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;


contract SampleUnits { 
    
    modifier betweenOneAndTwoEth() {
        require(msg.value >= 1 ether && msg.value <= 2 ether);
        _;
    }


   function sendMoney() public  payable  { 

   }
    

    uint runUntilTimeStamp;
    uint startTimestamp;

    constructor(uint startInDays) {
        startTimestamp = block.timestamp + ( startInDays * 1 days);
        runUntilTimeStamp = startTimestamp + 7 days;
    }

    //time units
    //seconds
    //hours
    //days
    //weeks
}
