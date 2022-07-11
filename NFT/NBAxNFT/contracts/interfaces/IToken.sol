// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

interface IToken {
    event Allowed(address, bool);
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
    event Locked(bool);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event RandomProcessed(
        uint256 stage,
        uint256 randUsed_,
        uint256 _start,
        uint256 _stop,
        uint256 _supply
    );
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    function _iRnd() external view returns (address);

    function _start1() external view returns (uint256);

    function approve(address to, uint256 tokenId) external;

    function availableToMint() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function batchMint(
        address[] memory recipients,
        uint256[] memory numberOfCards
    ) external;

    function constantReserved() external view returns (uint256);

    function getApproved(uint256 tokenId) external view returns (address);

    function index1() external view returns (uint256);

    function index2() external view returns (uint256);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);

    function mintCards(uint256 numberOfCards, address recipient) external;

    function name() external view returns (string memory);

    function owner() external view returns (address);

    function ownerOf(uint256 tokenId) external view returns (address);

    function permitted(address) external view returns (bool);

    function process(uint256 random, bytes32 reqID) external;

    function projectID() external view returns (uint256);

    function renounceOwnership() external;

    function reserveMintCards(uint256 numberOfCards, address recipient)
        external;

    function reserved() external view returns (uint256);

    function resetReveal() external;

    function retrieve721(address _tracker, uint256 id) external;

    function retrieveERC20(address _tracker, uint256 amount) external;

    function retrieveETH() external;

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

    function setAllowed(address _addr, bool _state) external;

    function setApprovalForAll(address operator, bool approved) external;

    function setPreRevealURI(string memory _pre) external;

    function setRevealedBaseURI(string memory revealedBaseURI) external;

    function setStart1(
        uint256 __start1,
        bool _status,
        string memory _stingSome
    ) external;

    function setTransferLock(bool locked) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function symbol() external view returns (string memory);

    function tellEverything()
        external
        view
        returns (token_interface.TKS memory);

    function tokenByIndex(uint256 index) external view returns (uint256);

    function tokenOfOwnerByIndex(address owner, uint256 index)
        external
        view
        returns (uint256);

    function tokenPreRevealURI() external view returns (string memory);

    function tokenURI(uint256 tokenId) external view returns (string memory);

    function totalSupply() external view returns (uint256);

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferOwnership(address newOwner) external;

    function uri(uint256 n) external view returns (uint256);
}

interface token_interface {
    struct TKS {
        uint256 _mintPosition;
        uint256 _ts1;
        uint256 _ts2;
        bool _randomReceived;
        bool _secondReceived;
        uint256 _randomCL;
        uint256 _randomCL2;
        bool _lockTillSaleEnd;
    }
}
