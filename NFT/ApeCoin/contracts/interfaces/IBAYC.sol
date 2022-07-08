// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IBAYC {
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

    function BAYC_PROVENANCE() external view returns (string memory);

    function MAX_APES() external view returns (uint256);

    function REVEAL_TIMESTAMP() external view returns (uint256);

    function apePrice() external view returns (uint256);

    function approve(address to, uint256 tokenId) external;

    function balanceOf(address owner) external view returns (uint256);

    function baseURI() external view returns (string memory);

    function emergencySetStartingIndexBlock() external;

    function flipSaleState() external;

    function getApproved(uint256 tokenId) external view returns (address);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    function maxApePurchase() external view returns (uint256);

    function mintApe(uint256 numberOfTokens) external payable;

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function ownerOf(uint256 tokenId) external view returns (address);

    function renounceOwnership() external;

    function reserveApes() external;

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

    function saleIsActive() external view returns (bool);

    function setApprovalForAll(address operator, bool approved) external;

    function setBaseURI(string memory baseURI) external;

    function setProvenanceHash(string memory provenanceHash) external;

    function setRevealTimestamp(uint256 revealTimeStamp) external;

    function setStartingIndex() external;

    function startingIndex() external view returns (uint256);

    function startingIndexBlock() external view returns (uint256);

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function tokenByIndex(uint256 index) external view returns (uint256);

    function tokenOfOwnerByIndex(address owner, uint256 index)
        external
        view
        returns (uint256);

    function tokenURI(uint256 tokenId) external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferOwnership(address newOwner) external;

    function withdraw() external;
}