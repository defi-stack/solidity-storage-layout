const hre = require("hardhat");
const { ethers } = require('ethers');

(async () => {
  const StringStorage = await (await hre.ethers.getContractFactory('StringStorage')).deploy();

  // single char endcode with UTF-8, and the last 2 bytes is the length of string
  // 0x4100000000000000000000000000000000000000000000000000000000000002
  // <data:31 bytes> <size:1 bytes>
  await StringStorage.set('A');
  console.log(await StringStorage.get(0));

  // one slot can store 31 char with size 62 bytes
  // 0x414243444520464748494a204b4c4d4e4f205051525354205556575859205a3e
  await StringStorage.set('ABCDE FGHIJ KLMNO PQRST UVWXY Z');
  console.log(await StringStorage.get(0));

  // if string size > 31 bytes, store to slot[keccak256(string slot)]
  // keccak256(0): 0x414243444520464748494a204b4c4d4e4f205051525354205556575859205a5a
  // keccak256(1): 0x5a00000000000000000000000000000000000000000000000000000000000000
  await StringStorage.set('ABCDE FGHIJ KLMNO PQRST UVWXY ZZZ');
  const mappingSlot = ethers.BigNumber.from(ethers.utils.solidityKeccak256(['uint256'], [0]))
  console.log(await StringStorage.get(mappingSlot));
  console.log(await StringStorage.get(mappingSlot.add(1)));
})();
