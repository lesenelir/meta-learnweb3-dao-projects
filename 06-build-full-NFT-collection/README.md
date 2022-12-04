# Build Full NFT collection

> Keep Building

#### NFT

- Non-Fungible Token
- ERC-721 is an open standard that describes how to build Non-Fungible tokens on EVM (Ethereum Virtual Machine) compatible blockchains; 
  it is a standard interface for Non-Fungible tokens; it has a set of rules which make it easy to work with NFTs.

#### Hardhat

- Hardhat is an Ethereum development environment and framework designed for full stack development.
- We can write smart contract, deploy them, run tests, and debug your code with hardhat.

`npm init -y`

`npm i hardhat -S`

`npx hardhat` and then `create a javascript project`

#### Alchemy

- A node provider that we can connect to various different blockchains.
- AWS EC2 for blockchain.
- Hardhat application will take smart contract and send it to the Ethereum node by Alchemy.

#### Six steps to build full whitelist dApp

- `npm i hardhat -S` and `npx hardhat` choose `create a javascript project`, to create a hardhat framework template

- Writing CryptoDevs.sol contract code

- Deploy contract to goeril test network 

  - write a deployment script (deploy.js)
  
  - conrigure the network with Alchemy and export `HTTP Provider` & `private key`
  
  - conrigure the hardhat.config.js
  
- Craete a website for calling the contract's function

## Related Screenshots

- Contract Address: 0x1b8F64Fa6156b11D55b5a218126120E13b631304
  
- Presale

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/06-build-full-NFT-collection/pic/01.png)

- Loading

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/06-build-full-NFT-collection/pic/02.png)

- Minted

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/06-build-full-NFT-collection/pic/03.png)
