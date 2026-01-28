# ERC1155 Game Items

This repository implements the ERC1155 Multi-Token standard. Unlike ERC721 (where every item is a separate contract state), ERC1155 allows you to manage thousands of different item types in one smart contract.

## Use Case
Perfect for gaming inventories where users hold:
- **Fungible Items**: Gold coins, Mana potions (Stackable).
- **Non-Fungible Items**: Unique Swords, Shields (1 of 1).

## Item IDs
- `0`: GOLD (Fungible)
- `1`: SILVER (Fungible)
- `2`: THORS_HAMMER (Non-Fungible)
- `3`: SWORD (Non-Fungible)

## Prerequisites
- Node.js
- Hardhat

## Setup
1. Install dependencies:
   ```bash
   npm install
