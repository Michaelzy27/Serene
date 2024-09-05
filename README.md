# Serene Solidity Project

## Overview

The Serene Solidity Project consists of two primary smart contracts:

1. **Serene Contract**: A contract for managing token withdrawals and tracking token balances.
2. **SereneUSDT Contract**: An ERC20 token implementation named SereneUSDT with basic token functionalities and minting capabilities.

## Contracts

### 1. Serene

The `Serene` contract allows an admin to withdraw ERC20 tokens from the contract and check the token balance of the contract.

#### Features

- **Admin Withdrawal**: Only the admin can withdraw ERC20 tokens from the contract.
- **Token Balance**: Allows checking the ERC20 token balance held by the contract.

#### Events

- `TokenWithdraw(IERC20 token, address from, address to, uint amount)`: Emitted when tokens are withdrawn.
- `TransferReceived(address from, uint amount)`: Emitted when Ether is received (though currently unused).

#### Functions

- `constructor()`: Sets the contract deployer as the admin.
- `receive() payable external`: Allows the contract to receive Ether (currently unused).
- `withdrawToken(IERC20 token, uint amount, address payable to)`: Withdraws a specified amount of ERC20 tokens to a given address.
- `tokenBalance(IERC20 token)`: Returns the balance of the specified ERC20 token held by the contract.

### 2. SereneUSDT

The `SereneUSDT` contract is a basic ERC20 token implementation with minting capabilities.

#### Features

- **ERC20 Compliance**: Implements standard ERC20 functions and events.
- **Minting**: Allows for the creation of new tokens and assigning them to an address.

#### Events

- `Transfer(address indexed from, address indexed to, uint value)`: Emitted on token transfers.
- `Approval(address indexed owner, address indexed spender, uint value)`: Emitted on token approvals.

#### Functions

- `constructor()`: Initializes the token with a symbol, name, decimals, and an initial supply.
- `totalSupply()`: Returns the total supply of the token.
- `balanceOf(address account)`: Returns the balance of a given address.
- `transfer(address recipient, uint amount)`: Transfers tokens from the caller to the recipient.
- `approve(address spender, uint amount)`: Approves a spender to spend a specified amount of tokens on behalf of the caller.
- `transferFrom(address sender, address recipient, uint amount)`: Transfers tokens from one address to another, given an allowance.
- `allowance(address owner, address spender)`: Returns the remaining number of tokens that a spender is allowed to spend on behalf of the owner.
- `mintTokens(uint amount, address minter)`: Mints new tokens and assigns them to a specified address.

## Installation

To use these contracts, you will need to set up a development environment for Solidity. Here’s a quick guide:

1. **Install [Node.js](https://nodejs.org/)**
2. **Install [Truffle Suite](https://www.trufflesuite.com/truffle) or [Hardhat](https://hardhat.org/)** for smart contract development and testing.

    ```bash
    npm install -g truffle
    # or
    npm install --save-dev hardhat
    ```

3. **Install [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)** for reusable smart contract components.

    ```bash
    npm install @openzeppelin/contracts
    ```

4. **Create a new Truffle or Hardhat project** and place the Solidity files in the `contracts/` directory.

5. **Compile and deploy the contracts** using Truffle or Hardhat commands.

## Usage

### Deploying

To deploy the contracts, use Truffle or Hardhat migration scripts. For example, with Truffle:

1. Create migration scripts in the `migrations/` directory.
2. Run the deployment command:

    ```bash
    truffle migrate
    ```

### Interacting

To interact with the deployed contracts, you can use Truffle Console, Hardhat Console, or integrate with a frontend using web3.js or ethers.js.

**Example using web3.js:**

```javascript
const Web3 = require('web3');
const web3 = new Web3('http://localhost:8545'); // or your Ethereum provider

const sereneAddress = '0xYourSereneContractAddress';
const sereneABI = [/* ABI array */];
const serene = new web3.eth.Contract(sereneABI, sereneAddress);

// Call functions on the contract
serene.methods.tokenBalance(tokenAddress).call().then(console.log);
