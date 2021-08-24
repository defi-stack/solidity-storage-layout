const assert = require('assert');
const hre = require("hardhat");
const { BigNumber } = require('ethers');

(async () => {
  const contract = await (await hre.ethers.getContractFactory('SimpleStorage')).deploy();
  await contract.set(22);
  assert.equal(22, (await contract.get()).toNumber());
})();
