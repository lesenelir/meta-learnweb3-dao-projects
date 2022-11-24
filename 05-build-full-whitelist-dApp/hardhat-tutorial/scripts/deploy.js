// 部署 deploy

const {ethers} = require('hardhat')

async function main() {

  // A ContractFactory in ethers is an abstraction used to deploy new smart contract
  const whitelistContract = await ethers.getContractFactory('Whitelist')

  // deploy the contract
  // the number of 10 is the max number of address in whitelist
  const deployedWhitelistContract = await whitelistContract.deploy(10)

  // 等待部署
  await deployedWhitelistContract.deployed()

  console.log('Whitelist Contract Address: ', deployedWhitelistContract.address)
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
