

// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.26;


contract MyContract {

  uint public myUint = 123;

  function setMyUint(uint _uint)public {
     myUint = _uint;
  }
}
