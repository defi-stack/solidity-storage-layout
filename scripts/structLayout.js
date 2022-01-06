const hre = require("hardhat");

(async () => {
  const StructLayout = await (await hre.ethers.getContractFactory('StructLayout')).deploy();

  await StructLayout.setFoo(11);
  await StructLayout.setBar(20);

  const data = await StructLayout.custom();
  console.log(data.foo.toNumber());
  console.log(data.bar.toNumber());

  await StructLayout.setCustom2(1, 2, 3, 4, 5, 6, true);
  console.log(await hre.ethers.provider.send(
    'eth_getStorageAt',
    [StructLayout.address, '0x2', 'latest'],
  ));
})();
