// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
 

contract Auction {
    address public highestBidder;
    uint256 public highestBid;
    uint256 public auctionEnd;

    constructor(){
        auctionEnd = block.timestamp + (7 * 24 * 60 * 60); //7 days in the future
    }

    function bid() external payable{
        require(msg.value > highestBid, "Bid is not high enough"); 
        require(block.timestamp <= auctionEnd, "Auction finished"); 

        //refund the previous highest bidder

        if(highestBidder != address(0)){
            (bool success,) = highestBidder.call{value: highestBid}("");
            require(success, "refund failed");
        }

        highestBidder = msg.sender;
        highestBid = msg.value;

    }
  

}