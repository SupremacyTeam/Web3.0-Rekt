// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

interface ISales {
    event Allowed(address, bool);
    event DustPresale(address from, uint256 number_of_items, uint256 price);
    event DustSale(address buyer, uint256 number_to_buy, uint256 dustAmount);
    event ETHPresale(address from, uint256 number_of_items, uint256 price);
    event ETHSale(address buyer, uint256 number_to_buy, uint256 ethAmount);
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
    event batchWhitelistMint(uint16 indexed batchNumber, address receiver);

    function _token() external view returns (address);

    function batchNumber() external view returns (uint16);

    function checkDiscountAvailable(address buyer)
        external
        view
        returns (
            bool[3] memory,
            bool,
            uint256,
            uint256,
            uint256
        );

    function checkPresaleIsActive() external view returns (bool);

    function checkSaleIsActive() external view returns (bool);

    function mint(uint256 numberOfCards) external;

    function mint_approved(
        dusty.vData memory info,
        uint256 number_of_items_requested,
        uint16 _batchNumber
    ) external;

    function owner() external view returns (address);

    function projectID() external view returns (uint256);

    function renounceOwnership() external;

    function retrieve721(address _tracker, uint256 id) external;

    function retrieveERC20(address _tracker, uint256 amount) external;

    function retrieveETH() external;

    function setMaxPerSaleMint(uint256 _maxPerSaleMint) external;

    function setPresaleDates(uint256 _start, uint256 _end) external;

    function setSaleDates(uint256 _start, uint256 _end) external;

    function setWallets(address[] memory _wallets, uint16[] memory _shares)
        external;

    function setup(uint16 _batchNumber) external;

    function tellEverything(address addr)
        external
        view
        returns (sale_data memory);

    function tokensReceived(
        address,
        address from,
        address,
        uint256 amount,
        bytes memory userData,
        bytes memory
    ) external;

    function transferOwnership(address newOwner) external;

    function verify(dusty.vData memory info) external view returns (bool);

    receive() external payable;
}

struct sale_params {
    uint256 projectID;
    address token;
    address ec;
    address dust;
    uint256 maxTokens;
    uint256 maxDiscount;
    uint256 maxPerSaleMint;
    uint256 clientMintLimit;
    uint256 ecMintLimit;
    uint256 discountedPerAddress;
    uint256 freeForEC;
    uint256 discountPrice;
    uint256 discountDustPrice;
    uint256 fullPrice;
    address signer;
    uint256 saleStart;
    uint256 saleEnd;
    uint256 presaleStart;
    uint256 presaleEnd;
    uint256 fullDustPrice;
    address[] wallets;
    uint16[] shares;
}

struct sale_data {
    uint256 maxTokens;
    uint256 mintPosition;
    address[] wallets;
    uint16[] shares;
    uint256 fullPrice;
    uint256 discountPrice;
    uint256 presaleStart;
    uint256 presaleEnd;
    uint256 saleStart;
    uint256 saleEnd;
    uint256 dustPrice;
    bool areTokensLocked;
    uint256 maxFreeEC;
    uint256 totalFreeEC;
    uint256 maxDiscount;
    uint256 totalDiscount;
    uint256 freePerAddress;
    uint256 discountedPerAddress;
    string tokenPreRevealURI;
    address signer;
    bool presaleIsActive;
    bool saleIsActive;
    bool dustMintingActive;
    uint256 freeClaimedByThisUser;
    uint256 discountedClaimedByThisUser;
    address etherCards;
    address DUST;
    address ecVault;
    uint256 maxPerSaleMint;
    uint256 MaxUserMintable;
    uint256 userMinted;
    bool randomReceived;
    bool secondReceived;
    uint256 randomCL;
    uint256 randomCL2;
    uint256 ts1;
    uint256 ts;
}

interface dusty {
    struct vData {
        bool mint_free;
        uint256 max_mint;
        address from;
        uint256 start;
        uint256 end;
        uint256 eth_price;
        uint256 dust_price;
        bytes signature;
    }
}
