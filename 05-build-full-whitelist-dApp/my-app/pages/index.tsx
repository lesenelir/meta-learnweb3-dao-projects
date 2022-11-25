import Head from 'next/head'
import styles from '../styles/Home.module.css'

function Home(): JSX.Element {
  return (
    <div className={styles.container}>
      <Head>
        <title>Create Next App</title>
        <meta name="description" content="whitelist dApp"/>
        <link rel="icon" href="/favicon.ico"/>
      </Head>

      <h1>Whitelist DApp</h1>
    </div>
  )
}

export default Home
