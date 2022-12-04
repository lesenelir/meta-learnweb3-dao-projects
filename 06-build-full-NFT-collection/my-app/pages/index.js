import Head from 'next/head'
import Image from "next/image"
import {Contract, providers, utils} from "ethers"
import React, {useEffect, useRef, useState} from "react"
import Web3Modal from 'web3modal'
import {abi, NFT_CONTRACT_ADDRESS} from "../constants"

import styles from '../styles/Home.module.css'

import pic0 from '../public/cryptodevs/0.svg'


function Home() {
  // whether wallet is connected or not
  const [walletConnected, setWalletConnected] = useState(false)
  // whether the presale has started or not
  const [presaleStarted, setPresaleStarted] = useState(false)
  // whether the presale end
  const [presaleEnded, setPresaleEnded] = useState(false)
  // loading waiting for a transaction to get mined
  const [loading, setLoading] = useState(false)
  // check if the currently connected wallet is the owner of the contract
  const [isOwner, setIsOwner] = useState(false)
  // tokenIdsMinted keeps track of the number of tokenIds that have been minted
  const [tokenIdsMinted, setTokenIdsMinted] = useState('0')
  // create a reference to the web3 modal (used for connecting to metamask)
  const web3ModalRef = useRef()

  /**
   * Returns a Provider or Signer object representing the Ethereum RPC with or without the
   * signing capabilities of metamask attached
   *
   * A `Provider` is needed to interact with the blockchain - reading transactions, reading balances, reading state, etc.
   *
   * A `Signer` is a special type of Provider used in case a `write` transaction needs to be made to the blockchain, which involves the connected account
   * needing to make a digital signature to authorize the transaction being sent. Metamask exposes a Signer API to allow your website to
   * request signatures from the user using Signer functions.
   *
   * @param {*} needSigner - True if you need the signer, default false otherwise
   */
  const getProviderOrSigner = async (needSigner = false) => {
    const provider = await web3ModalRef.current.connect()
    const web3Provider = new providers.Web3Provider(provider)

    const {chainId} = await web3Provider.getNetwork()
    if (chainId !== 5) {
      window.alert("change the network to Goerli")
      throw new Error("Change the network to Goerli")
    }

    if (needSigner) {
      return web3Provider.getSigner()
    }

    return web3Provider
  }

  // mint NFT during the presale
  const presaleMint = async () => {
    try {
      // write a transaction , so need "Signer"
      const signer = await getProviderOrSigner(true)
      // create a instance of the contract with a signer which allows update methods
      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, signer)
      // call the presaleMint from the contract , 调用NFT合约中的函数
      const tx = await nftContract.presaleMint({
        // the cost of one crypto dev which is "0.002" eth.
        value: utils.parseEther("0.002")
      })
      setLoading(true)
      // wait  for the transaction to get mined
      // 只要是Signer，要往区块链中写入数据，就需要时间等待交易的完成
      await tx.wait()
      setLoading(false)
      window.alert("You successfully minted a Crypto Dev !")
    } catch (e) {
      console.error(e)
    }
  }

  // mint NFT in public time (after presale)
  const publicMint = async () => {
    try {
      const signer = await getProviderOrSigner(true)

      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, signer)
      const tx = await nftContract.mint({
        value: utils.parseEther("0.002")
      })
      setLoading(true)
      await tx.wait()
      setLoading(false)
      window.alert("You successfully minted a Crypto Dev !")
    } catch (e) {
      console.error(e)
    }
  }

  // connect the metamask wallet
  const connectWallet = async () => {
    try {
      await getProviderOrSigner()
      setWalletConnected(true)
    } catch (e) {
      console.error(e)
    }
  }

  // start the presale for the NFT collection
  const startPresale = async () => {
    try {
      const signer = await getProviderOrSigner(true)

      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, signer)
      const tx = await nftContract.startPresale()
      setLoading(true)
      await tx.wait()
      setLoading(false)
      // set the presale started to true
      await checkIfPresaleStarted()
    } catch (e) {
      console.error(e)
    }
  }

  // checks if the presale has started by querying the `presaleStarted`
  // variable in the contract
  const checkIfPresaleStarted = async () => {
    try {
      const provider = await getProviderOrSigner()

      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, provider)
      const _presaleStarted = await nftContract.presaleStarted()
      if (!_presaleStarted) {
        await getOwner()
      }
      setPresaleStarted(_presaleStarted)
      return _presaleStarted
    } catch (e) {
      console.error(e)
      return false
    }
  }

  // checks if the presale has started by querying the `presaleEnded`
  // variable in the contract
  const checkIfPresaleEnded = async () => {
    try {
      const provider = await getProviderOrSigner()

      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, provider)
      const _presaleEnded = await nftContract.presaleEnded()
      const hasEnded = _presaleEnded.lt(Math.floor(Date.now() / 1000))
      if (hasEnded) {
        setPresaleEnded(true)
      } else {
        setPresaleEnded(false)
      }
      return hasEnded
    } catch (e) {
      console.error(e)
      return false
    }
  }

  // call this function to  retrieve the owner
  const getOwner = async () => {
    try {
      const provider = await getProviderOrSigner()

      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, provider)
      const _owner = await nftContract.owner()

      const signer = await getProviderOrSigner(true)
      // Get the address associated to the signer which is connected to  MetaMask
      const address = await signer.getAddress()
      if (address.toLowerCase() === _owner.toLowerCase()) {
        setIsOwner(true)
      }
    } catch (e) {
      console.error(e.message())
    }
  }

  // get the number of tokenIds that have been minted
  const getTokenIdsMinted = async () => {
    try {
      const provider = await getProviderOrSigner()
      const nftContract = new Contract(NFT_CONTRACT_ADDRESS, abi, provider)
      const _tokenIds = await nftContract.tokenIds()

      setTokenIdsMinted(_tokenIds.toString())
    } catch (e) {
      console.error(e)
    }
  }

  useEffect(() => {
    if (!walletConnected) {
      web3ModalRef.current = new Web3Modal({
        network: 'goerli',
        providerOptions: {},
        disableInjectedProvider: false
      })
    }
    connectWallet()

    // check if presale has started and ended
    const _presaleStarted = checkIfPresaleStarted()
    if (_presaleStarted) {
      checkIfPresaleEnded()
    }
    getTokenIdsMinted()

    // Set an interval which gets called every 5 seconds to check presale has ended
    const presaleEndedInterval = setInterval(async function () {
      const _presaleStarted = await checkIfPresaleStarted()
      if (_presaleStarted) {
        const _presaleEnded = await checkIfPresaleEnded()
        if (_presaleEnded) {
          clearInterval(presaleEndedInterval)
        }
      }
    }, 5 * 1000)

    setInterval(async function () {
      await getTokenIdsMinted()
    }, 5 * 1000)

  }, [walletConnected])

  const renderButton = () => {
    // If wallet is not connected, return a button which allows them to connect their wllet
    if (!walletConnected) {
      return (
        <button onClick={connectWallet} className={styles.button}>
          Connect your wallet
        </button>
      )
    }

    // If we are currently waiting for something, return a loading button
    if (loading) {
      return <button className={styles.button}>Loading...</button>
    }

    // If connected user is the owner, and presale hasn't started yet, allow them to start the presale
    if (isOwner && !presaleStarted) {
      return (
        <button className={styles.button} onClick={startPresale}>
          Start Presale!
        </button>
      )
    }

    // If connected user is not the owner but presale hasn't started yet, tell them that
    if (!presaleStarted) {
      return (
        <div>
          <div className={styles.description}>Presale hasnt started!</div>
        </div>
      )
    }

    // If presale started, but hasn't ended yet, allow for minting during the presale period
    if (presaleStarted && !presaleEnded) {
      return (
        <div>
          <div className={styles.description}>
            Presale has started!!! If your address is whitelisted, Mint a Crypto
            Dev 🥳
          </div>
          <button className={styles.button} onClick={presaleMint}>
            Presale Mint 🚀
          </button>
        </div>
      )
    }

    // If presale started and has ended, its time for public minting
    if (presaleStarted && presaleEnded) {
      return (
        <button className={styles.button} onClick={publicMint}>
          Public Mint 🚀
        </button>
      )
    }
  }


  return (
    <>
      <Head>
        <title>Crypto Devs</title>
        <meta name='description' content='Whitelist-DApp'/>
        <link rel="icon" href="/favicon.ico"/>
      </Head>

      <div className={styles.main}>
        <div>
          <h1 className={styles.title}>Welcome to Crypto Devs!</h1>
          <div className={styles.description}>
            Its an NFT collection for developers in Crypto.
          </div>
          <div className={styles.description}>
            {tokenIdsMinted}/20 have been minted
          </div>
          {renderButton()}
        </div>
        <div>
          <Image className={styles.image} src={pic0} alt="Picture0"/>
        </div>
      </div>

      <footer className={styles.footer}>
        Made with &#10084; by Crypto Devs
      </footer>
    </>
  )
}

export default Home
