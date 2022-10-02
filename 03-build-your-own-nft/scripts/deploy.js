const {ethers} = require("hardhat")

// 编写部署脚本，并配置network
async function main() {
  const nftContract = await ethers.getContractFactory("GameItem")
  const deployedNFTContract = await nftContract.deploy() // 部署合约

  await deployedNFTContract.deployed() // 等待合约的部署

  // 打印合约地址
  console.log("NFT Contract Address: ", deployedNFTContract.address)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error)
    process.exit(1)
  })
