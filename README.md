# solidity-storage-layout

Contracts to illustrate solidity storage layout.

## Storage Layout

Solidity use 2^256 slots to store state variables. Difference type has its own
way to be store in slots.

- Array: `ArrayLayout.sol`
- Mapping: `MappingLayout.sol`
- Inheritance: `InheritLayout.sol`
## Storage Collision

- DelegateExample

## Framework & Plugins

- [hardhat](https://hardhat.org/)
- [hardhat-storage-layout](https://hardhat.org/plugins/hardhat-storage-layout.html)
