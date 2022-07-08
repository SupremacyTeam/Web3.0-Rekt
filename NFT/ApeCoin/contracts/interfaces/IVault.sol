// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IVault {
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    event EligibilityDeployed(uint256 moduleIndex, address eligibilityAddr);
    event EnableMintUpdated(bool enabled);
    event EnableRandomRedeemUpdated(bool enabled);
    event EnableRandomSwapUpdated(bool enabled);
    event EnableTargetRedeemUpdated(bool enabled);
    event EnableTargetSwapUpdated(bool enabled);
    event ManagerSet(address manager);
    event MetaDataChange(
        string oldName,
        string oldSymbol,
        string newName,
        string newSymbol
    );
    event Minted(uint256[] nftIds, uint256[] amounts, address to);
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Redeemed(uint256[] nftIds, uint256[] specificIds, address to);
    event Swapped(
        uint256[] nftIds,
        uint256[] amounts,
        uint256[] specificIds,
        uint256[] redeemedIds,
        address to
    );
    event Transfer(address indexed from, address indexed to, uint256 value);
    event VaultInit(
        uint256 indexed vaultId,
        address assetAddress,
        bool is1155,
        bool allowAllItems
    );
    event VaultShutdown(
        address assetAddress,
        uint256 numItems,
        address recipient
    );

    function __NFTXVault_init(
        string memory _name,
        string memory _symbol,
        address _assetAddress,
        bool _is1155,
        bool _allowAllItems
    ) external;

    function allHoldings() external view returns (uint256[] memory);

    function allValidNFTs(uint256[] memory tokenIds)
        external
        view
        returns (bool);

    function allowAllItems() external view returns (bool);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 amount) external returns (bool);

    function assetAddress() external view returns (address);

    function balanceOf(address account) external view returns (uint256);

    function decimals() external view returns (uint8);

    function decreaseAllowance(address spender, uint256 subtractedValue)
        external
        returns (bool);

    function deployEligibilityStorage(
        uint256 moduleIndex,
        bytes memory initData
    ) external returns (address);

    function disableVaultFees() external;

    function eligibilityStorage() external view returns (address);

    function enableMint() external view returns (bool);

    function enableRandomRedeem() external view returns (bool);

    function enableRandomSwap() external view returns (bool);

    function enableTargetRedeem() external view returns (bool);

    function enableTargetSwap() external view returns (bool);

    function finalizeVault() external;

    function flashFee(address token, uint256 amount)
        external
        view
        returns (uint256);

    function flashLoan(
        address receiver,
        address token,
        uint256 amount,
        bytes memory data
    ) external returns (bool);

    function increaseAllowance(address spender, uint256 addedValue)
        external
        returns (bool);

    function is1155() external view returns (bool);

    function manager() external view returns (address);

    function maxFlashLoan(address token) external view returns (uint256);

    function mint(uint256[] memory tokenIds, uint256[] memory amounts)
        external
        returns (uint256);

    function mintFee() external view returns (uint256);

    function mintTo(
        uint256[] memory tokenIds,
        uint256[] memory amounts,
        address to
    ) external returns (uint256);

    function name() external view returns (string memory);

    function nftIdAt(uint256 holdingsIndex) external view returns (uint256);

    function onERC1155BatchReceived(
        address operator,
        address,
        uint256[] memory,
        uint256[] memory,
        bytes memory
    ) external returns (bytes4);

    function onERC1155Received(
        address operator,
        address,
        uint256,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function onERC721Received(
        address operator,
        address,
        uint256,
        bytes memory
    ) external returns (bytes4);

    function owner() external view returns (address);

    function randomRedeemFee() external view returns (uint256);

    function randomSwapFee() external view returns (uint256);

    function redeem(uint256 amount, uint256[] memory specificIds)
        external
        returns (uint256[] memory);

    function redeemTo(
        uint256 amount,
        uint256[] memory specificIds,
        address to
    ) external returns (uint256[] memory);

    function renounceOwnership() external;

    function retrieveTokens(
        uint256 amount,
        address from,
        address to
    ) external;

    function setFees(
        uint256 _mintFee,
        uint256 _randomRedeemFee,
        uint256 _targetRedeemFee,
        uint256 _randomSwapFee,
        uint256 _targetSwapFee
    ) external;

    function setManager(address _manager) external;

    function setVaultFeatures(
        bool _enableMint,
        bool _enableRandomRedeem,
        bool _enableTargetRedeem,
        bool _enableRandomSwap,
        bool _enableTargetSwap
    ) external;

    function setVaultMetadata(string memory name_, string memory symbol_)
        external;

    function shutdown(address recipient) external;

    function supportsInterface(bytes4 interfaceId) external view returns (bool);

    function swap(
        uint256[] memory tokenIds,
        uint256[] memory amounts,
        uint256[] memory specificIds
    ) external returns (uint256[] memory);

    function swapTo(
        uint256[] memory tokenIds,
        uint256[] memory amounts,
        uint256[] memory specificIds,
        address to
    ) external returns (uint256[] memory);

    function symbol() external view returns (string memory);

    function targetRedeemFee() external view returns (uint256);

    function targetSwapFee() external view returns (uint256);

    function totalHoldings() external view returns (uint256);

    function totalSupply() external view returns (uint256);

    function transfer(address recipient, uint256 amount)
        external
        returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    function transferOwnership(address newOwner) external;

    function vaultFactory() external view returns (address);

    function vaultFees()
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256,
            uint256
        );

    function vaultId() external view returns (uint256);

    function version() external pure returns (string memory);
}
