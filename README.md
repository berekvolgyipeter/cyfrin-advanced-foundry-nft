# cyfrin-advanced-foundry-nft

## sublesson

### check function signature

```zsh
cast sig "mintNFT(string)"
```

returns `0xfb37e883` which is the function signature

### check calldata

```zsh
cast --calldata-decode "mintNFT(string)" 0xfb37e883000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000076578616d706c6500000000000000000000000000000000000000000000000000
```

returns `"example"` which is the argument passed to the function at this call

note that the first four bytes of the calldata are the same as the function signature bytes

the rest of the calldata bytes are encoded arguments of the function calldata
