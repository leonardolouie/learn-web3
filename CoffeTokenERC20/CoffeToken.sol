pragma solidity 0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; needs to download ERC20 zepplin
import "@openzeppelin/contracts/access/AccessControl.sol"; // needs to download ERC20 zepplin

contract CoffeeToken is ERC20, AccessControl {
    bytes32 public constant COUNTER_ROLE = keccak256("COUNTER_ROLE");


    event CoffePurchaseEvent(address indexed received, address indexed buyer);

    constructor() ERC20("LEO COFEE TOKEN", "LCT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(COUNTER_ROLE, msg.sender);
        _mint(msg.sender, 100);
    }

    function mint(address to, uint256 amount) public onlyRole(COUNTER_ROLE) {
        _mint(to, amount);
    }


    function buyOneCoffee() public {
        _burn(msg.sender, 1);
        emit  CoffePurchaseEvent(msg.sender, msg.sender);
    }


    function buyOneCoffeeFrom(address account) public {
        _spendAllowance(account, msg.sender, 1);
        _burn(account, 1);
        emit  CoffePurchaseEvent(msg.sender, account);
    }   

}