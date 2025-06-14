// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Practice {
    address public owner;
    mapping(address => uint256) public data;
    uint256 totalbalance;

    constructor(){
        owner=msg.sender;
    }

    function AcceptDonate() public payable{
        require(msg.value > 0, "Too small amount");
        data[msg.sender] += msg.value; // {"arsalan" : 200}
        totalbalance += msg.value;
    }

    function showTotalBalance() public view returns(uint256){
        require(msg.sender == owner, "only for owner");
        return totalbalance;
    }

    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

    function getDonation(address donor) public view returns(uint256){
        return data[donor];
    }
    
    function withdraw() public {
        require(msg.sender == owner, "Not the owner");
        payable(owner).transfer(address(this).balance);
        totalbalance = 0;
    }
}