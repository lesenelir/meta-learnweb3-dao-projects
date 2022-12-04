export default function handler (req, res) {
  const tokenId = req.query.tokenId
  const image_url =
    "https://raw.githubusercontent.com/LearnWeb3DAO/NFT-Collection/main/my-app/public/cryptodevs/"

  // The api is sending back metadata for a Crypto Dev
  res.status(200).json({
    name: "Crypto Dev #" + tokenId,
    description: "Crypto Dev is a collection of developers in crypto",
    image: image_url + tokenId + ".svg",
  })
}
