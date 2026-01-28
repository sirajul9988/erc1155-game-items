// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155, Ownable {
    // Define Item Constants
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;

    // Metadata name mapping (optional, for on-chain clarity)
    mapping(uint256 => string) public names;

    constructor() ERC1155("https://game-api.example.com/api/item/{id}.json") Ownable(msg.sender) {
        // Set names
        names[GOLD] = "Gold Coin";
        names[SILVER] = "Silver Bar";
        names[THORS_HAMMER] = "Thor's Hammer";
        names[SWORD] = "Iron Sword";

        // Initial Minting to Deployer
        // Mint 1000 Gold
        _mint(msg.sender, GOLD, 1000, "");
        // Mint 500 Silver
        _mint(msg.sender, SILVER, 500, "");
        // Mint 1 Thor's Hammer
        _mint(msg.sender, THORS_HAMMER, 1, "");
    }

    // Allow owner to mint new items (e.g., rewards)
    function mint(address account, uint256 id, uint256 amount, bytes memory data) public onlyOwner {
        _mint(account, id, amount, data);
    }

    // Batch minting for gas efficiency
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data) public onlyOwner {
        _mintBatch(to, ids, amounts, data);
    }

    // Custom URI override if needed
    function uri(uint256 _tokenid) public view override returns (string memory) {
        return string(abi.encodePacked(super.uri(_tokenid), Strings.toString(_tokenid)));
    }
}
