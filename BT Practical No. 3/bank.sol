// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank {
    address public accHolder;
    uint256 balance = 0;

    constructor() {
        accHolder = msg.sender;
    }

    function withdraw() public {
        require(msg.sender == accHolder, "You are not the account owner.");
        require(balance > 0, "You don't have enough balance.");
        payable(msg.sender).transfer(balance);
        balance = 0; // Set balance to 0 after withdrawal to prevent re-entrancy
    }

    function deposit() public payable {
        require(msg.sender == accHolder, "You are not the account owner.");
        require(msg.value > 0, "Deposit amount must be greater than 0.");
        balance += msg.value;
    }

    function showBalance() public view returns (uint256) {
        require(msg.sender == accHolder, "You are not the account owner.");
        return balance;
    }
}
