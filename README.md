# solidity-storage-layout

Contracts to illustrate solidity storage layout.

## Storage Layout

Solidity use 2^256 slots to store state variables. Difference type has its own way to be store in slots.

- [x] Fixed Size Array: `FixedSizeArray.sol`
- [x] Dynamic Size Array: `DynamicArray.sol`
- [ ] Mapping: `MappingLayout.sol`
- [ ] Inheritance: `InheritLayout.sol`

## Storage Collision

- DelegateExample

## Development

```sh
forge install
forge test
```

## Related Plugins

- [hardhat-storage-layout](https://hardhat.org/plugins/hardhat-storage-layout.html)
