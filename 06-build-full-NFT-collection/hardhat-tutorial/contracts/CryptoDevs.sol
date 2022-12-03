// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IWhitelist.sol";

contract CryptoDevs is ERC721Enumerable, Ownable {
    // _baseTokenURI for computing {tokenURI}
    // resulting URI for each token will be the concatenation of the 'baseURI' and the 'tokenId'
    string _baseTokenURI;

    // the price of the one Crypto Dev NFT
    uint256 public _price = 0.002 ether;

    // used to pause the contract in case of an emergency
    bool public _paused;

    // max number of NFT
    uint256 public maxTokenIds = 20;

    // total number of tokenIds minted
    uint256 public tokenIds;

    // Whitelist contract instance
    IWhitelist whitelist;

    // boolean to keep track of whether presale started or not. 是否为预售
    bool public presaleStarted;

    // timestamp for when presale would end. 预售还剩多少时间截止
    uint256 public presaleEnded;

    // 函数修改器，可以在函数调用前或调用后执行
    modifier onlyWhenNotPaused {
        require(!_paused, 'Contract currently paused');
        _;
    }

    /**
    *   ERC721 constructor takes in a `name` and a `symbol` to the token collection.
    *   name: "Crypto Devs" ; symbol: "CB"
    *   Constructor for Crypto Devs takes in the baseURI to set _baseTokenURI for the NFT collection
    *   initialize an instance of whitelist interface
    */
    constructor (string memory baseURI, address whitelistContract) ERC721("Crypto Devs", "CD") {
        _baseTokenURI = baseURI;
        whitelist = IWhitelist(whitelistContract);
    }

    // start a preSale for the whitelisted address
    function startPresale() public onlyOwner {
        presaleStarted = true;
        // 预售截止时间是当前时刻+5分钟，即总共预售5分钟
        presaleEnded = block.timestamp + 5 minutes;
    }

    // allow a user to mint one NFT per transaction during the presale
    function presaleMint() public payable onlyWhenNotPaused {
        require(presaleStarted && block.timestamp < presaleEnded, "Presale is not running");
        require(whitelist.whitelistedAddresses(msg.sender), "You are not whitelisted");
        require(tokenIds < maxTokenIds, "Exceeded maximum Crypto Devs supply");
        require(msg.value >= _price, "Ether sent is not enough");
        tokenIds += 1;
        _safeMint(msg.sender, tokenIds);
    }

    // returned an empty string for the baseURI
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    // makes the contract paused or unPaused
    function setPaused(bool val) public onlyOwner {
        _paused = val;
    }

    // withdraw sends all the ether in the contract
    // to the owner of the contract
    function withdraw() public onlyOwner {
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    // Function to receive Ether msg.data must by empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}
