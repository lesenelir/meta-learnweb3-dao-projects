import Head from 'next/head'
import Image from 'next/image'
import Web3Modal from 'web3modal'
import {useEffect, useRef, useState} from "react"
import {Contract, providers} from "ethers"
import {WHITELIST_CONTRACT_ADDRESS, abi} from "../constants"

import devsPic from '../public/crypto-devs.svg'
import styles from '../styles/Home.module.css'

function Home() {
  // check whether the user's wallet is connected or not
  const [walletConnected, setWalletConnected] = useState(false)
  // check the current metamask address has joined the wallet
  const [joinedWhitelist, setJoinedWhitelist] = useState(false)
  // true  ===>  waiting for a transaction to get mined
  const [loading, setLoading] = useState(false)
  // the number of address's whitelist
  const [numberOfWhitelisted, setNumberOfWhitelisted] = useState(0)
  // Create a reference to the Web3 Modal (used for connecting to Metamask)
  // which persists as long as the page is open
  const web3ModalRef = useRef(null)

  /**
   * Returns a Provider or Signer object representing the Ethereum RPC with or without the
   * signing capabilities of metamask attached
   *
   * A `Provider` is needed to interact with the blockchain  节点的抽象, 读取区块链内容
   * - reading transactions, reading balances, reading state, etc.
   *
   * A `Signer` is a special type of Provider used in case a `write` transaction needs to be made to the blockchain, 钱包抽象，向区块链写入数据
   * which involves the connected account
   * needing to make a digital signature to authorize the transaction being sent.
   * Metamask exposes a Signer API to allow your website to
   * request signatures from the user using Signer functions.
   *
   * @param {*} needSigner - True if you need the signer, default false otherwise
   */
  const getProviderOrSigner = async (needSigner = false) => {
    // Connect to MetaMask
    const provider = await web3ModalRef.current.connect()
    const web3Provider = new providers.Web3Provider(provider)

    if (needSigner) {
      return web3Provider.getSigner()
    }

    // if user not connected to testNetwork, let them know
    const {chainId} = await web3Provider.getNetwork()
    if (chainId !== 5) {
      window.alert('Please change the network to Goerli')
      throw new Error('Please change the network to Goerli')
    }

    return web3Provider
  }


  // add current address to the whitelist
  const addAddressToWhitelist = async () => {
    try {
      // 向区块链网络写入数据，需要用到signer，所以传递的参数为true
      const signer = await getProviderOrSigner(true)
      // whitelist Contract
      const whitelistContract = new Contract(
        WHITELIST_CONTRACT_ADDRESS,
        abi,
        signer
      )

      // call Whitelist.sol function
      const tx = await whitelistContract.addAddressToWhitelist()
      setLoading(true)
      // wait for the transaction to get mined
      await tx.wait()
      setLoading(false)
      // get the updated number of addresses in the whitelist
      await getNumberOfWhitelisted()
      setJoinedWhitelist(true)

    } catch (error) {
      console.error(error)
    }
  }

  // gets the number of whitelisted addresses
  const getNumberOfWhitelisted = async () => {
    try {
      // reading data from blockchain
      // no need for the Signer here
      const provider = await getProviderOrSigner(false)
      // connect to the contract using a Provider, so we only have read-only access to the Contract
      const whitelistContract = new Contract(
        WHITELIST_CONTRACT_ADDRESS,
        abi,
        provider
      )
      // call the numAddressesWhitelisted from the contract
      const _numberOfWhitelisted = await whitelistContract.numAddressesWhitelisted()
      setNumberOfWhitelisted(_numberOfWhitelisted)
    } catch (error) {
      console.error(error)
    }
  }

  // check if the address is in whitelist
  const checkIfAddressInWhitelist = async () => {
    try {
      // need signer to get the user's address
      // Even though it is a read transaction,
      // since Signers are just special kinds of Providers,
      // 此处也可以provider，但signer不仅仅可以向区块链写入数据，也可以读，具有双向功能
      const signer = await getProviderOrSigner(true)
      const whitelistContract = new Contract(
        WHITELIST_CONTRACT_ADDRESS,
        abi,
        signer
      )

      const address = await signer.getAddress()
      // call the whitelistedAddresses from the contract
      const _joinedWhitelist = await whitelistContract.whitelistedAddresses(
        address
      )
      setJoinedWhitelist(_joinedWhitelist)

    } catch (error) {
      console.error(error)
    }
  }

  // Connect the Metamask wallet
  const connectWallet = async () => {
    try {
      // Get the provider from web3Modal, which in our case is MetaMask
      // When used for the first time, it prompts the user to connect their wallet
      await getProviderOrSigner(false)
      setWalletConnected(true)

      await checkIfAddressInWhitelist()
      await getNumberOfWhitelisted()
    } catch (error) {
      console.error(error)
    }
  }

  const renderButton = () => {
    if (walletConnected) {
      if (joinedWhitelist) {
        return (
          <div className={styles.description}>
            Thanks for joining the Whitelist!
          </div>
        )
      } else if (loading) {
        return <button className={styles.button}>Loading...</button>;
      } else {
        return (
          <button onClick={addAddressToWhitelist} className={styles.button}>
            Join the Whitelist
          </button>
        )
      }
    } else {
      return (
        <button onClick={connectWallet} className={styles.button}>
          Connect your wallet
        </button>
      )
    }
  }

  // useEffects are used to react to changes in state of the website
  useEffect(() => {
    if (!walletConnected) {
      web3ModalRef.current = new Web3Modal({
        network: 'goerli',
        providerOptions: {},
        disableInjectedProvider: false
      })
      connectWallet().then(r => console.log(r))
    }
  }, [walletConnected])

  console.log(web3ModalRef.current)

  return (
    <>
      <Head>
        <title>Whitelist dApp</title>
        <meta name="description" content="whitelist dApp"/>
        <link rel="icon" href="/favicon.ico"/>
      </Head>

      <div className={styles.main}>
        <div>
          <h1 className={styles.title}>Welcome to Crypto Devs!</h1>
          <div className={styles.description}>
            Its an NFT collection for developers in Crypto.
          </div>
          <div className={styles.description}>
            XX have already joined the Whitelist
          </div>
          {renderButton()}
        </div>
        <div>
          <Image className={styles.image} src={devsPic} alt="Picture of the author"/>
        </div>
      </div>

      <footer className={styles.footer}>
        Made with &#10084; by Lesenelir Crypto
      </footer>
    </>
  )
}

export default Home
