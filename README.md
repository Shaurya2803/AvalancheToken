# Eth-Avalanche Module-4 Token

This project is about Creating a Degen_Token for representing game asset or items , where one can keep trak of items and also have feature to redeem those items. This contract also added to Avalanche network , and verify contract on the snowtrace.

## Description

The "ShauryaDegen.sol" contract, deployed on the Avalanche network using MetaMask and the Remix IDE, is a custom ERC-20 token designed to facilitate a token-based economy within a game or application. It supports minting, transferring, and burning of tokens, allowing users to effectively manage their token balances.
Users can mint, transfer, and burn tokens, providing flexibility in handling their digital assets.The contract includes an item management system, enabling the owner to add items with specific prices. Users can redeem these items by burning the corresponding amount of tokens, creating an engaging gamified experience where tokens act as currency for in-game assets.To create your own token, the contract imports "ERC20.sol," which provides predefined functions essential for building a token.

. 

## Getting Started


### Executing program

* To run only solidity program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a.sol extension (e.g., project.sol). Copy and paste the following code into the file:
First Copy the Below code into your own Contract which You have Created, and make sure that u have imported the ERC20.sol file and also its other dependencies i.e IERC20.sol and Context.sol.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";

// import "./ERC20.sol";

contract AkDegenToken is ERC20 {

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

    function Transfer_token(address account, uint256 value) external {
        _transfer(msg.sender, account, value);
    }

    // function to check their balance at any time
    function Token_balance() external view  returns (uint256){
        return  balanceOf(msg.sender);
    }

    // function to burn their token no longeer needed
    function Token_burn(address account, uint256 value) external {
        _burn(account, value);
    }

    //function to reedem  all tokens or items
    function redeem_items(uint itemID) public {
        Item memory item = items[itemID];
        require(balanceOf(msg.sender) >= item.price,"insuffiecent balance to reddeem");
        _burn(msg.sender,item.price);
    }

}



To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile project.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Mtoken - project.sol" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling all the functions.



# To run the entire project you can use this steps

You will want to do the following steps to run the project :-

1. First of all , install the metamask wallet on Browser.
2. After this , try following the steps from this site https://docs.avax.network/build/dapp/smart-contracts/get-funds-faucet . On this site https://core.app/tools/testnet-faucet/?subnet=c&token=c choose Select Network as "Fuji (C-Chain)" , choose Select Token as "AVAX" , put Address as your metamask account address and get coupon code from this site https://guild.xyz/avalanche/avalanche-developers by passing requirements . Click on button "Add subnet to wallet" to add network to metamask and then click on button "Request 2 AVAX" to add Testnet AVAX native tokens to account .
3. Add all files on the remix.
4. Open "AkDefenToken.sol" file and in Solidity compiler section , drop-down Advanced Configurations and select EVM VERSION as "london" and also tick the checkbox Enable optimization then click on the "Compile AkDefenToken.sol" button.
5. In DEPLOY & RUN TRANSACTIONS section , Select ENVIRONMENT as "Injected Provider - Metamask" and select the account in which you have Testnet AVAX native tokens . Select the "Mtoken - project.sol" contract from the dropdown menu, and then click on the "Deploy" button after passing the name and symbol of token. Then confirm the transaction from metamask and now your contract is deployed .
Once the contract is deployed, you can interact with it by calling all the functions and confirming all the transactions .
6. You can check all the transactions , Degen tokens and left Testnet AVAX native tokens to confirm transactions(Used as gas fee) on the following AVALANCHE Testnet site https://subnets-test.avax.network/ by putting the metamask account address in the searchbar of site. You can also use Snowtrace site https://testnet.snowtrace.io/ if it is working by putting the metamask account address in the searchbar of site.
7. Everything is Done , Our Project is completed.
## Authors

Shaurya Anand- student 

## License

This project is licensed under the MIT License - see the LICENSE.md file for details# AvalancheToken
