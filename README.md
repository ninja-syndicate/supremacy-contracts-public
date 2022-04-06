# Supremacy Smart Contracts

Files:

- Accounting_Redeemer.sol: Faucet for redemption of SUPS for USDC
- Accounting_Withdrawer.sol: Withdraw SUPS from game
- Crypto_SignatureVerifier.sol: Signature verification for server-side authorization of on-chain actions
- ERC20_Mock.sol: Used to mock ERC20s
- ERC20_SUPS.sol: Credits used to power the economy
- ERC20_Staking_Pool.sol: Staking system
- ERC721_NFT.sol: Minting war machines
- ERC721_NFTStaking.sol: Staking NFTs into the game

Some useful commands.

```shell
npx hardhat compile
npx hardhat test
npx hardhat coverage
```

## Contract Addresses

### Mainnet

Contracts

- [ETH Core] NFT Limited V2 contract deployed to: 0xCA949036Ad7cb19C53b54BdD7b358cD12Cf0b810
- [ETH Core] NFT V2 Genesis contract deployed to: 0x651D4424F34e6e918D8e4D2Da4dF3DEbDAe83D0C
- [ETH Core] NFT V2 Standard contract deployed to: 0x52d7A31e2f5CfA6De6BABb2787c0dF842298f5e6
- [ETH Core] NFT Staking V2 contract deployed to: 0x6476dB7cFfeeBf7Cc47Ed8D4996d1D60608AAf95

- [ETH Core] NFT contract deployed to: 0x24447528deb67F492Af4AF7fb3Afb89476e0bCfD
- [ETH Core] Staking contract deployed to: 0xaD0ABD755cD93cad2fe2f1CAeb9257Eb791e2059
- [BSC Core] SUPS ERC20 contract deployed to: 0xc99cFaA8f5D9BD9050182f29b83cc9888C5846C4
- [BSC Core] Withdrawer contract deployed to: 0x6476dB7cFfeeBf7Cc47Ed8D4996d1D60608AAf95

Wallets

- Operator: 0xeCfB1f31F012Db0bf6720610301F23F064c567f9
- Treasury/Purchase: 0x52b38626D3167e5357FE7348624352B7062fE271

External Contracts

- Pancakeswap Router Address: 0x10ED43C718714eb63d5aA57B78B54704E256024E
- USDC: 0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48
- BUSD: 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56

Staking Contracts

- Liquidity Farming deployed to: 0x768F80c7B256cf921F8C557CeC9D0Bd97766f253

### Testnet

Wallets

- Operator: 0xc01c2f6DD7cCd2B9F8DB9aa1Da9933edaBc5079E
- Treasury/Purchase: 0x7D6439fDF9B096b29b77afa28b3083c0a329c7fE

Contracts

- [ETH Goerli] NFT Limited V2 contract deployed to: 0x440e2CcE53F5a61Bb997ac67D8D45a2898daD27b
- [ETH Goerli] NFT Genesis V2 contract deployed to: 0xEEfaF47acaa803176F1711c1cE783e790E4E750D
- [ETH Goerli] NFT Staking V2 contract deployed to: 0x0497e0F8FC07DaaAf2BC1da1eace3F5E60d008b8
- [ETH Goerli] NFT contract deployed to: 0xC1ce98F52E771Bd82938c4Cb6CCaA40Dc2B3258D
- [ETH Goerli] Staking contract deployed to: 0xceED4Db9234e7374fe3132a2610c31275712685C

- [BSC Core] SUPS ERC20 contract deployed to: 0x5e8b6999B44E011F485028bf1AF0aF601F845304
- [BSC Core] Withdrawer contract deployed to: 0x9DAcEA338E4DDd856B152Ce553C7540DF920Bb15

External Contracts

- Pancakeswap LP Tokens: 0xd96E4e2e0b1b41cad0627431A8cDA64aAa5AcD01
- [ETH TESTNET] USDC: 0x8BB4eC208CDDE7761ac7f3346deBb9C931f80A33
- [BSC TESTNET]: BUSD: 0xeAf33Ba4AcA3fE3110EAddD7D4cf0897121583D0

Staking Contracts

- Liquidity Farming deployed to: 0x20034d860bf43ef6d6dded79a8d73e857e10960c
