const hre = require('hardhat');

(async () => {
  const contract = await (await hre.ethers.getContractFactory('MappingLayout')).deploy();

  // update
  for (let i = 0; i < 5; i++) {
    await contract.update(i, i+1);
  }

  // delete: delete in Solidity just reset the value
  contract.del(2);

  for (let i = 0; i<5; i++) {
    console.log(`key=${i}: `, (await contract.get(i)).toNumber());
  }
})();
