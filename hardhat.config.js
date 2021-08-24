const path = require('path');

require('@nomiclabs/hardhat-ethers');
require('hardhat-storage-layout');

const config = {
  solidity: {
    compilers: [
      {
        version: "0.8.0",
        settings: {
          optimizer: { enabled: true, runs: 200 },
          outputSelection: {
            "*": {
              "*": ["storageLayout"],
            },
          },
        },
      },
    ],
  },

  paths: {
    sources: path.resolve(__dirname, "contracts"),
    tests: path.resolve(__dirname, "tests"),
    cache: path.resolve(__dirname, ".cache"),
    artifacts: path.resolve(__dirname, "dist/artifacts"),
  },
}

module.exports = config;
