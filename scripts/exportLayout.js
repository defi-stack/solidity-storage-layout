const hre = require("hardhat");

(async () => {
  await hre.storageLayout.export();
})();
