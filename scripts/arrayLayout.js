const hre = require('hardhat');

(async () => {
  const contract = await (await hre.ethers.getContractFactory('ArrayLayout')).deploy();

  // push
  for (let i = 0; i < 5; i++) {
    await contract.push(i + 1);
  }

  // update
  await contract.update(2, 10);

  // delete
  await contract.del(3);

  // log
  for (let i = 0; i < 5; i++) {
    console.log(`arr[${i}]: `, (await contract.get(i)).toNumber());
  }
})();
