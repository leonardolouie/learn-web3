

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract WillThrow {
     
     error NotAllowed(string);

    function aFunction() public  pure {
        // require(false, "Throw an error message"); require
        // assert(false); panic
        revert NotAllowed("You are not allowed");
    }

}


contract ErrorHandling { 
   
   event ErrorLogging(string reason);
   event ErrorLogCode(uint code);
   event ErrorLogBytes(bytes lowLevelData);

   function catchTheError() public { 
     WillThrow will = new WillThrow();

     try will.aFunction(){ 
        //do something
     }
     catch Error(string memory reason) {
        emit ErrorLogging(reason);
     } catch Panic(uint errorCode) { //assertion 
        emit ErrorLogCode(errorCode);
     } catch (bytes memory lowLevelData) {
        emit ErrorLogBytes(lowLevelData); // final

        //encoded string  response
        //"0x367dccf700000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000013596f7520617265206e6f7420616c6c6f77656400000000000000000000000000"
        // use web3.utils.toAscii("bytecode") to see the error
     }
   }

}