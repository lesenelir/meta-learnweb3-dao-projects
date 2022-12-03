const {ethers} = require('hardhat')
require('dotenv').config({path: '.env'})
const {WHITELIST_CONTRACT_ADDRESS, METADATA_URL} = require("../constants/idnex")


async function main() {
  const whitelistContract = WHITELIST_CONTRACT_ADDRESS
  const metadataURL = METADATA_URL

  const cryptoDevsContract = await ethers.getContractFactory("CryptoDevs")

  // deploy the contract
  const deloyedCryptoDevsContract = await cryptoDevsContract.deploy(
    metadataURL,
    whitelistContract
  )

  console.log(
    "Crypto Devs Contract Address:",
    deloyedCryptoDevsContract.address
  )
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
