// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract FundMe {
    uint256 public myValue=5e18;
    function fund() public payable {
        myValue = myValue + 2;
        require(getConversionRate(msg.value) >= myValue, "can't send this transaction!");
    }
    // 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
    function getPrice() public view returns(uint256){
      AggregatorV3Interface pricefeed =AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
      (,int256  price,,,) = pricefeed.latestRoundData();
      return uint256(price * 0.1e18) ;
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256){
      uint256 eth_price = getPrice();
      uint256 ethAmountInUSD = (ethAmount*eth_price)/1e18;
      return ethAmountInUSD;
    }

    function withdraw() public {}
}