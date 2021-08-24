const hre = require("hardhat");

(async () => {
  const A = await (await hre.ethers.getContractFactory('A2')).deploy();
  const B = await (await hre.ethers.getContractFactory('B2')).deploy();
  await A.add(B.address, 1, 2);
  // `other` was set
  console.log('value', (await A._value()).toNumber());
  console.log('other', (await A.other()).toNumber());
})();
