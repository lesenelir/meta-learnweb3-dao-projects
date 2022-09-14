# Build Your First DAPP
> Keep Building

#### Three Steps to build this DAPP
- Build HTML Page
- Use solidity to creat a smart contract, and then deploy this contract to rinkey test network
- Interact with HTML pages and smart contracts with ethers.js

#### Two parts needed to know when a contract is deployed:
- Contract's address
- Contract's ABI

```js
// Contract's address
0xAA34d32cc9bD2DcF2D1f99ab693f0735424Db4b7
// Contract's ABI
// The ABI of a contract is an array of JSON elements
[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_mood",
				"type": "string"
			}
		],
		"name": "setMood",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getMood",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]
```

## Related Screenshots

- Remix Deploys Contracts to Rinkeby Test Network via Inject Web3

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/01-build-your-first-dApp/pic/01.png)

- Smart contract block

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/01-build-your-first-dApp/pic/02.png)

- Contract account trading information

![](https://raw.githubusercontent.com/lesenelir/meta-learnweb3-dao-projects/master/01-build-your-first-dApp/pic/03.png)
