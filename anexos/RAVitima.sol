// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
 

contract Carteira {
    mapping (address => uint) public balances;//user => balance


    
    constructor(){}

    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }

    bool private isProcessing = false;

    function withdraw(uint amount) external {
        require(!isProcessing,"Reentry Blocked");
        isProcessing = true;

        require(balances[msg.sender] >= amount, "Insuficient funds");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);

        isProcessing = false;


    }
  

}