// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface ILand {
    function supportsInterface(bytes4 id) external pure returns (bool);

    function name() external pure returns (string memory);

    function getApproved(uint256 id) external view returns (address);

    function approve(address operator, uint256 id) external;

    function height() external returns (uint256);

    function batchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        bytes memory data
    ) external;

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) external;

    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        bytes memory data
    ) external;

    function approveFor(
        address sender,
        address operator,
        uint256 id
    ) external;

    function transferQuad(
        address from,
        address to,
        uint256 size,
        uint256 x,
        uint256 y,
        bytes memory data
    ) external;

    function x(uint256 id) external returns (uint256);

    function safeTransferFrom(
        address from,
        address to,
        uint256 id
    ) external;

    function burn(uint256 id) external;

    function y(uint256 id) external returns (uint256);

    function ownerOf(uint256 id) external view returns (address owner);

    function isSuperOperator(address who) external view returns (bool);

    function mintQuad(
        address to,
        uint256 size,
        uint256 x,
        uint256 y,
        bytes memory data
    ) external;

    function getAdmin() external view returns (address);

    function _burn(
        address from,
        address owner,
        uint256 id
    ) external;

    function balanceOf(address owner) external view returns (uint256);

    function burnFrom(address from, uint256 id) external;

    function _numNFTPerAddress(address) external view returns (uint256);

    function setMetaTransactionProcessor(
        address metaTransactionProcessor,
        bool enabled
    ) external;

    function changeAdmin(address newAdmin) external;

    function symbol() external pure returns (string memory);

    function _owners(uint256) external view returns (uint256);

    function _operatorsForAll(address, address) external view returns (bool);

    function width() external returns (uint256);

    function setApprovalForAll(address operator, bool approved) external;

    function isMinter(address who) external view returns (bool);

    function setSuperOperator(address superOperator, bool enabled) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        bytes memory data
    ) external;

    function _operators(uint256) external view returns (address);

    function tokenURI(uint256 id) external view returns (string memory);

    function setMinter(address minter, bool enabled) external;

    function isMetaTransactionProcessor(address who)
        external
        view
        returns (bool);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool isOperator);

    function batchTransferQuad(
        address from,
        address to,
        uint256[] memory sizes,
        uint256[] memory xs,
        uint256[] memory ys,
        bytes memory data
    ) external;

    function setApprovalForAllFor(
        address sender,
        address operator,
        bool approved
    ) external;

    event Minter(address superOperator, bool enabled);
    event MetaTransactionProcessor(
        address metaTransactionProcessor,
        bool enabled
    );
    event SuperOperator(address superOperator, bool enabled);
    event AdminChanged(address oldAdmin, address newAdmin);
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 indexed _tokenId
    );
    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 indexed _tokenId
    );
    event ApprovalForAll(
        address indexed _owner,
        address indexed _operator,
        bool _approved
    );
}