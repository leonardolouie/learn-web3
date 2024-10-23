
//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract CoffeeToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");


    event CoffePurchaseEvent(address indexed received, address indexed buyer);

    constructor() ERC20("LEO COFEE TOKEN", "LCT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _mint(msg.sender, 1 ether);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount * 1 ether);
    }

    function buyOneCoffee() public {
        _burn(msg.sender, 1 ether);
        emit  CoffePurchaseEvent(msg.sender, msg.sender);
    }


    function buyOneCoffeeFrom(address account) public {
        _spendAllowance(account, msg.sender,1 ether);
        _burn(account, 1 ether);
        emit  CoffePurchaseEvent(msg.sender, account);
    }   

}