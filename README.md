# Module 4

This project demonstrates the use of require(), assert(), and revert() statements in Solidity smart contracts.

## Description

This Solidity contract, named SimpleToken, is an ERC20 token implementation with functionalities for minting, burning, and transferring tokens. It incorporates defensive programming practices by utilizing the `require`, `assert`, and `revert` functions to enforce preconditions, validate assertions, and revert state changes when necessary. Additionally, it includes a modifier to restrict certain actions to the contract owner and ensures address validity during transfers.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "HelloWorld" contract from the dropdown menu, and then click on the "Deploy" button.

## Authors

Metacrafter
[@yannaarmaza]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
