// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

interface IPool {
    event Borrow(
        address indexed reserve,
        address user,
        address indexed onBehalfOf,
        uint256 amount,
        uint8 interestRateMode,
        uint256 borrowRate,
        uint16 indexed referralCode
    );
    event FlashClaim(
        address indexed target,
        address indexed initiator,
        address indexed nftAsset,
        uint256 tokenId
    );
    event LiquidationCall(
        address indexed collateralAsset,
        address indexed debtAsset,
        address indexed user,
        uint256 debtToCover,
        uint256 liquidatedCollateralAmount,
        address liquidator,
        bool receiveOToken
    );
    event MintedToTreasury(address indexed reserve, uint256 amountMinted);
    event RebalanceStableBorrowRate(
        address indexed reserve,
        address indexed user
    );
    event Repay(
        address indexed reserve,
        address indexed user,
        address indexed repayer,
        uint256 amount,
        bool useOTokens
    );
    event ReserveDataUpdated(
        address indexed reserve,
        uint256 liquidityRate,
        uint256 stableBorrowRate,
        uint256 variableBorrowRate,
        uint256 liquidityIndex,
        uint256 variableBorrowIndex
    );
    event ReserveUsedAsCollateralDisabled(
        address indexed reserve,
        address indexed user
    );
    event ReserveUsedAsCollateralEnabled(
        address indexed reserve,
        address indexed user
    );
    event Supply(
        address indexed reserve,
        address user,
        address indexed onBehalfOf,
        uint256 amount,
        uint16 indexed referralCode
    );
    event SupplyERC721(
        address indexed reserve,
        address user,
        address indexed onBehalfOf,
        DataTypes.ERC721SupplyParams[] tokenData,
        uint16 indexed referralCode
    );
    event SwapBorrowRateMode(
        address indexed reserve,
        address indexed user,
        uint8 interestRateMode
    );
    event Withdraw(
        address indexed reserve,
        address indexed user,
        address indexed to,
        uint256 amount
    );
    event WithdrawERC721(
        address indexed reserve,
        address indexed user,
        address indexed to,
        uint256[] tokenIds
    );

    function ADDRESSES_PROVIDER() external view returns (address);

    function MAX_NUMBER_RESERVES() external view returns (uint16);

    function MAX_STABLE_RATE_BORROW_SIZE_PERCENT()
        external
        view
        returns (uint256);

    function POOL_REVISION() external view returns (uint256);

    function borrow(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        uint16 referralCode,
        address onBehalfOf
    ) external;

    function dropReserve(address asset) external;

    function finalizeTransfer(
        address asset,
        address from,
        address to,
        bool usedAsCollateral,
        uint256 value,
        uint256 balanceFromBefore,
        uint256 balanceToBefore
    ) external;

    function flashClaim(
        address receiverAddress,
        address nftAsset,
        uint256[] memory nftTokenIds,
        bytes memory params
    ) external;

    function getConfiguration(address asset)
        external
        view
        returns (DataTypes.ReserveConfigurationMap memory);

    function getReserveAddressById(uint16 id) external view returns (address);

    function getReserveData(address asset)
        external
        view
        returns (DataTypes.ReserveData memory);

    function getReserveNormalizedIncome(address asset)
        external
        view
        returns (uint256);

    function getReserveNormalizedVariableDebt(address asset)
        external
        view
        returns (uint256);

    function getReservesList() external view returns (address[] memory);

    function getUserAccountData(address user)
        external
        view
        returns (
            uint256 totalCollateralBase,
            uint256 totalDebtBase,
            uint256 availableBorrowsBase,
            uint256 currentLiquidationThreshold,
            uint256 ltv,
            uint256 healthFactor,
            uint256 erc721HealthFactor
        );

    function getUserConfiguration(address user)
        external
        view
        returns (DataTypes.ReserveConfigurationMap memory);

    function initReserve(
        address asset,
        uint8 assetType,
        address xTokenAddress,
        address stableDebtAddress,
        address variableDebtAddress,
        address interestRateStrategyAddress
    ) external;

    function initialize(address provider) external;

    function liquidationCall(
        address collateralAsset,
        address debtAsset,
        address user,
        uint256 debtToCover,
        bool receiveOToken
    ) external;

    function liquidationERC721(
        address collateralAsset,
        address liquidationAsset,
        address user,
        uint256 collateralTokenId,
        uint256 liquidationAmount,
        bool receiveNToken
    ) external;

    function mintToTreasury(address[] memory assets) external;

    function rebalanceStableBorrowRate(address asset, address user) external;

    function repay(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        address onBehalfOf
    ) external returns (uint256);

    function repayWithOTokens(
        address asset,
        uint256 amount,
        uint256 interestRateMode
    ) external returns (uint256);

    function repayWithPermit(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        address onBehalfOf,
        uint256 deadline,
        uint8 permitV,
        bytes32 permitR,
        bytes32 permitS
    ) external returns (uint256);

    function rescueTokens(
        address token,
        address to,
        uint256 amount
    ) external;

    function setConfiguration(
        address asset,
        DataTypes.ReserveConfigurationMap memory configuration
    ) external;

    function setReserveInterestRateStrategyAddress(
        address asset,
        address rateStrategyAddress
    ) external;

    function setUserUseERC721AsCollateral(
        address asset,
        uint256 tokenId,
        bool useAsCollateral
    ) external;

    function setUserUseReserveAsCollateral(address asset, bool useAsCollateral)
        external;

    function supply(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
    ) external;

    function supplyERC721(
        address asset,
        DataTypes.ERC721SupplyParams[] memory tokenData,
        address onBehalfOf,
        uint16 referralCode
    ) external;

    function supplyWithPermit(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode,
        uint256 deadline,
        uint8 permitV,
        bytes32 permitR,
        bytes32 permitS
    ) external;

    function swapBorrowRateMode(address asset, uint256 interestRateMode)
        external;

    function withdraw(
        address asset,
        uint256 amount,
        address to
    ) external returns (uint256);

    function withdrawERC721(
        address asset,
        uint256[] memory tokenIds,
        address to
    ) external returns (uint256);
}

interface DataTypes {
    struct ERC721SupplyParams {
        uint256 tokenId;
        bool useAsCollateral;
    }

    struct ReserveConfigurationMap {
        uint256 data;
    }

    struct ReserveData {
        ReserveConfigurationMap configuration;
        uint128 liquidityIndex;
        uint128 currentLiquidityRate;
        uint128 variableBorrowIndex;
        uint128 currentVariableBorrowRate;
        uint128 currentStableBorrowRate;
        uint40 lastUpdateTimestamp;
        uint16 id;
        uint8 assetType;
        address xTokenAddress;
        address stableDebtTokenAddress;
        address variableDebtTokenAddress;
        address interestRateStrategyAddress;
        uint128 accruedToTreasury;
    }
}
