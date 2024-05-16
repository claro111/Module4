// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleToken is ERC20 {
    address private owner;

    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(recipient != address(0), "Invalid address");
        return super.transfer(recipient, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

     function burnFrom(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }

    function redeem(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        // Add logic for redeeming tokens for some benefit here
    }
    

}

