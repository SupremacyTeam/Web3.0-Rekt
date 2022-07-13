// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IDoodles {
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

    function MAX_PUBLIC_MINT() external view returns (uint256);

    function MAX_SUPPLY() external view returns (uint256);

    function PRICE_PER_TOKEN() external view returns (uint256);

    function PROVENANCE() external view returns (string memory);

    function approve(address to, uint256 tokenId) external;

    function balanceOf(address owner) external view returns (uint256);

    function getApproved(uint256 tokenId) external view returns (address);

    function isAllowListActive() external view returns (bool);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    function mint(uint256 numberOfTokens) external payable;

    function mintAllowList(uint8 numberOfTokens) external payable;

    function name() external view returns (string memory);

    function numAvailableToMint(address addr) external view returns (uint8);

    function owner() external view returns (address);

    function ownerOf(uint256 tokenId) external view returns (address);

    function renounceOwnership() external;

    function reserve(uint256 n) external;

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

    function setAllowList(address[] memory addresses, uint8 numAllowedToMint)
        external;

    function setApprovalForAll(address operator, bool approved) external;

    function setBaseURI(string memory baseURI_) external;

    function setIsAllowListActive(bool _isAllowListActive) external;

    function setProvenance(string memory provenance) external;

    function setSaleState(bool newState) external;

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