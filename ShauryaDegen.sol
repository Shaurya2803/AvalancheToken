// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ShauryaDegen is ERC20 {

    struct Item{
        uint id;
        string name;
        uint price;
    }
    mapping(uint256 => Item) public items;
    uint public nextItemId;

    address owner = msg.sender;

    modifier onlyOwner {
        require(owner == msg.sender, "only owner can access conrract");
        _;
    }
     constructor(string memory name, string memory symbol) ERC20(name, symbol)  {
        // Mint 100 tokens to msg.sender
        // Similar to how
        // 1 dollar = 100 cents
        // 1 token = 1 * (10 ** decimals)

        
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // function to onwer can transfer tokens 

    function TransferToken(address account, uint256 value) external {
        _transfer(msg.sender, account, value);
    }

    // function to check their balance at any time
    function TokenBalance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

    // function to burn their token no longeer needed
    function TokenBurn(address account, uint256 value) external {
        _burn(account, value);
    }
    //function to reedem  all tokens or items
    function redeemItems(uint itemID) public {
        Item memory item = items[itemID];
        require(balanceOf(msg.sender) >= item.price,"insuffiecent balance to reddeem");
        _burn(msg.sender,item.price);
    }

}
