// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {MyNewFund} from "./MyNewFund.sol";

error NotOwner();

contract FundMe {
    using MyNewFund for uint256;

    uint256 public myValue=5e18;
    address[] public userSenders;
    mapping(address => uint256) public fundsCollected;
    
    address public owner;

    constructor() {
      owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= myValue, "can't send this transaction!");
        userSenders.push(msg.sender);
        fundsCollected[msg.sender] += msg.value;


    }

    function withdraw() public CheckOwner{
      for (uint256 i = 0;i < userSenders.length;i++){
        address sender = userSenders[i];
        fundsCollected[sender] = 0;
      }
      userSenders = new address[](0);

      (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
      require(callSuccess, "Call fail!");
    }

    function show_transactions(uint256 num) public view returns(address) {
      return userSenders[num];
    }

    modifier CheckOwner() {
      if (msg.sender != owner){revert NotOwner();}
      _;
    }
}