// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyNewFund{
    uint256 public num=7349;

    function show_num() view public returns(uint256) {
        return num;
    }
}