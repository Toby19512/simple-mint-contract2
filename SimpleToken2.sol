// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleToken2 {

    string public name = "Atlag";
    string public symbol = "@lag";
    uint256 public totalSupply = 0;
    address owner;
    struct List {
        address sender;
        address reciever;
        uint256 amount;
    }
    List [] masterList;
    mapping (address => uint256) public balanceOf;
    event Transfer (address indexed from, address indexed to, uint256 value);
    event Mint (address indexed to, uint256 value);
    event Burn (address indexed from, uint256 value);


    constructor (uint256 initialSupply) {
        totalSupply = initialSupply;
        owner = msg.sender;
        balanceOf[msg.sender] = initialSupply;
        emit Mint (msg.sender, initialSupply);

    }

    modifier onlyOwner() {
        require(msg.sender == owner, "only owner allowed to perform action");
        _;
    }

    //tranfer of tokens between accounts
    function transfer (address _to, uint256 amount) public {
        uint256 senderBal = balanceOf[msg.sender];
        require(senderBal >= amount && amount > 0 , "invalid amount");

        unchecked{
            balanceOf[msg.sender] = senderBal - amount;
            balanceOf[_to] += amount;
        }
        masterList.push(List(msg.sender, _to, amount));
        emit Transfer(msg.sender, _to, amount);
    
    }

    // Owner can mint new tokens to increase total supply
    function mint (uint256 amount) onlyOwner public {
        require(amount > 0 && amount <= 200, "invalid amount");
        totalSupply += amount;
        balanceOf[owner] += amount;
        emit Mint (owner, amount);
    }

    //Owner can burn some tokens to reduce total supply
    function burn (uint256 amount) onlyOwner public {
        uint256 senderBalance = balanceOf[msg.sender];
        require(senderBalance >= amount && amount > 0);
        unchecked{
            balanceOf[msg.sender] = senderBalance - amount;
            totalSupply -= amount;
        }
        emit Burn(msg.sender, amount);
    }

    //get the transaction history manually
    function getTransfers () public view returns (List[]memory) {
        return masterList;
    }
}