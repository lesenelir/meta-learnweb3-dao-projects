# Build Full Whitelist DAPP

> Keep Building

#### Whitelist

- Give your early supporters user access to a whitelist for your NFT collection.
- Create a website dApp for early user

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

- Writing Whitelist.sol contract code

- Deploy contract to goeril test network 

  - write a deployment script (deploy.js)
  
  - conrigure the network with Alchemy and export `HTTP Provider` & `private key`
  
  - conrigure the hardhat.config.js
  
- Craete a website for calling the contract's function

## Related Screenshots

- Contract Address: 0x581155e2f6D532f4ae6ebE62a3e5882B9a94A9F5
  
- Alchemy dashboard

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/05-build-full-whitelist-dApp/pic/01.png)

- The Contract in goerli scan

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/05-build-full-whitelist-dApp/pic/02.png)
