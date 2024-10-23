//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

abstract contract IERC20 {
    function transfer(address to, uint amount) public virtual returns(bool);
    function decimals() public virtual view returns(uint8);
}

contract TokenSale { // A token that will interact with CoffeeToken
 
    uint public tokenPriceInWei = 1 ether;
    uint public profit;
    IERC20 token;


    constructor(address _token) {
        token = IERC20(_token);
    }

    function purchase() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");
        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;
        token.transfer(msg.sender, tokensToTransfer * 10 ** token.decimals()); //transfer from supply 
        payable(msg.sender).transfer(remainder); //send the rest back
    }
}