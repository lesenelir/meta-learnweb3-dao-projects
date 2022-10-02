// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// 该GameItem合约是遵循ERC271标准
contract GameItem is ERC721 {
    constructor() ERC721("GameItem", "ITM") {
        // mint NFT 给合约调用者，在constructor 合约调用者即为合约创建者
        _mint(msg.sender, 1);
    }
}
