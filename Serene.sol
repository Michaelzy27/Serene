// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Serene {
    address admin;

    modifier onlyAdmin() {
        require(msg.sender == admin);
        _;
    }

    event TokenWithdraw(IERC20 token, address from, address to, uint amount);
    event TransferReceived(address from, uint amount);

    constructor() {
        admin = msg.sender;
    }

    receive() payable external {
        
    }

    function withdrawToken(IERC20 token, uint amount, address payable to) public onlyAdmin {
        uint256 erc20Balannce = token.balanceOf(address(this));
        require(amount <= erc20Balannce, "insufficient balance");
        token.transfer(to, amount);
        emit TokenWithdraw(token, address(this), to, amount);
    }

}