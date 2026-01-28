const hre = require("hardhat");

async function main() {
  const [owner, player1] = await hre.ethers.getSigners();

  const GameItems = await hre.ethers.getContractFactory("GameItems");
  const gameItems = await GameItems.deploy();
  await gameItems.waitForDeployment();

  console.log(`GameItems deployed to: ${gameItems.target}`);

  // Check Owner Balance
  const goldBalance = await gameItems.balanceOf(owner.address, 0);
  console.log(`Owner Gold Balance: ${goldBalance.toString()}`);

  // Airdrop items to Player 1
  // Give 100 Gold and 1 Sword
  await gameItems.mintBatch(player1.address, [0, 3], [100, 1], "0x");
  console.log("Minted 100 Gold and 1 Sword to Player 1");

  const p1Gold = await gameItems.balanceOf(player1.address, 0);
  const p1Sword = await gameItems.balanceOf(player1.address, 3);
  console.log(`Player 1 - Gold: ${p1Gold}, Sword: ${p1Sword}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
