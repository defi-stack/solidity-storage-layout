const hre = require("hardhat");

(async () => {
  const A = await (await hre.ethers.getContractFactory('A1')).deploy();
  const B = await (await hre.ethers.getContractFactory('B1')).deploy();
  await A.add(B.address, 1, 2);
  // A's `value` was set
  console.log((await A._value()).toNumber());
})();
