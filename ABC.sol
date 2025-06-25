// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error NotOwner();

contract ABC{
    address public owner;
    mapping(address => bool) admins;
    address[] alladmins;

    constructor(){
        owner = msg.sender;
        admins[owner]=true;
    }
    function addadmin(address admin) checkadmin public{
        admins[admin]=true;
        alladmins.push(admin);
    }

    modifier checkadmin(){
        require(admins[owner], "your are not admin bro!");
        _;
    }
}
