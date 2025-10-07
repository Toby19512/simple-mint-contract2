# Simple NFT Collection

This Solidity project demonstrates how to create a basic ERC721 (NFT) smart contract where each token is unique and owned by a specific address. It’s built to help beginners understand how minting, ownership, and token URIs work in an NFT system.

## Features

* Mint unique NFTs with a name and metadata URI
* Track ownership of each NFT
* View total number of minted tokens
* Only the contract owner can mint new NFTs

## Smart Contract Overview

* **Language:** Solidity `^0.8.18`
* **Network Compatibility:** Ethereum Virtual Machine (EVM) compatible chains
* **License:** MIT

## How It Works

Each time a new token is minted, it gets a unique ID and is assigned to the minter. The contract keeps track of token ownership and total minted NFTs.

## Getting Started

1. Open the contract in [Remix IDE](https://remix.ethereum.org)
2. Compile using Solidity `^0.8.18`
3. Deploy to any EVM-compatible testnet (like Sepolia or Goerli)
4. Use the `mintNFT` function to create new NFTs

## Example

```solidity
mintNFT("0xYourAddressHere", "ipfs://your-metadata-link");
```

## Author

**Tobenna Samuel**
GitHub: [@Toby19512](https://github.com/Toby19512)

---

*Built for learning and experimentation with smart contracts.*
