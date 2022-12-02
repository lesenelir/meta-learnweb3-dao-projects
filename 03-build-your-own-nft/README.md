# Build Your Own NFT

> Keep Building

#### ERC-721

- ERC-721 specifically is a standard for creating NFT's.
- Most NFTs on Ethereum comply with the ERC-20 specification.

#### Hardhat

- Hardhat is an Ethereum development environment and framework designed for full stack development.
- We can write smart contract, deploy them, run tests, and debug your code with hardhat.

`npm init -y`

`npm i hardhat -S`

`npx hardhat` and then `create a javascript project`

#### Quicknode

- A node provider that we can connect to various different blockchains.
- AWS EC2 for blockchain.
- Hardhat application will take smart contract and send it to the Ethereum node by Quicknode.

#### Six steps to build your own nft

- `npm i hardhat -S` and `npx hardhat` choose `create a javascript project`, to create a hardhat framework template

- Import ERC721 smart contract standard

- Create a smart contract to inherit the ERC721 contract and then `npx hardhat compile` to compile contract

- Deploy contract to goeril test network

  - write a deployment script (deploy.js)

  - configure the network with quicknode and export `HTTP Provider` & `private key`

  - configure the hardhat.config.js

- The contract call the constructor of the parent contract and call the related methods from the parent contract

- See your own nft in testnets.opensea.io

## Related Screenshots

- Quicknode dashboard

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/03-build-your-own-nft/pic/01.png)

- The Contract in goerli scan

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/03-build-your-own-nft/pic/02.png)

- Own NFT in testnets opensea

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/03-build-your-own-nft/pic/03.png)

- Create contract wallet address success mint nft

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/03-build-your-own-nft/pic/04.png)
