// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IFlippazOne {
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    function MAX_SUPPLY() external view returns (uint256);

    function approve(address to, uint256 tokenId) external;

    function auctionDuration() external view returns (uint256);

    function auctionEndTimestamp() external view returns (uint256);

    function auctionEnded() external view returns (bool);

    function auctionStartTimestamp() external view returns (uint256);

    function auctionStarted() external view returns (bool);

    function balanceOf(address owner) external view returns (uint256);

    function baseURI() external view returns (string memory);

    function bid() external payable;

    function bidderWithdraw() external;

    function bids(address) external view returns (uint256);

    function boughtNow() external view returns (bool);

    function burn(uint256 tokenId) external;

    function buyNow() external payable;

    function buyNowMultiplier() external view returns (uint256);

    function buyNowPrice() external view returns (uint256);

    function buyNowPriceUntilBid() external view returns (uint256);

    function editBaseUri(string memory newUri) external;

    function editBuyNowMultipler(uint256 newMultiplier) external;

    function editDuration(uint256 newDuration) external;

    function editMinBidStep(uint256 newMinBidStep) external;

    function endAuction() external;

    function getApproved(uint256 tokenId) external view returns (address);

    function getBidderByIndex(uint256 bidderIndex)
        external
        view
        returns (address);

    function getBidderPaidAmount(address bidder)
        external
        view
        returns (uint256);

    function getBuyNowPrice() external view returns (uint256);

    function hasAddressBidded(address) external view returns (bool);

    function highestBid() external view returns (uint256);

    function highestBidder() external view returns (address);

    function isApprovedForAll(address _owner, address operator)
        external
        view
        returns (bool);

    function isAuctionActive() external view returns (bool);

    function isBuyNowActive() external view returns (bool);

    function minBidStep() external view returns (uint256);

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function ownerOf(uint256 tokenId) external view returns (address);

    function ownerWithdraw() external;

    function ownerWithdrawAll() external;

    function ownerWithdrawAllTo(address toAddress) external;

    function ownerWithdrawTo(address toAddress) external;

    function projectProxy(address) external view returns (bool);

    function proxyRegistryAddress() external view returns (address);

    function refundBids() external;

    function renounceOwnership() external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) external;

    function setApprovalForAll(address operator, bool approved) external;

    function startAuction() external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function tokenURI(uint256 tokenId) external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferOwnership(address newOwner) external;
}
