// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

interface IAirdrop {
    event AirDrop(
        address indexed account,
        uint256 indexed amount,
        uint256 timestamp
    );
    event AlphaClaimed(
        uint256 indexed tokenId,
        address indexed account,
        uint256 timestamp
    );
    event BetaClaimed(
        uint256 indexed tokenId,
        address indexed account,
        uint256 timestamp
    );
    event ClaimStart(uint256 _claimDuration, uint256 _claimStartTime);
    event GammaClaimed(
        uint256 indexed tokenId,
        address indexed account,
        uint256 timestamp
    );
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    event Paused(address account);
    event Unpaused(address account);

    function ALPHA_DISTRIBUTION_AMOUNT() external view returns (uint256);

    function BETA_DISTRIBUTION_AMOUNT() external view returns (uint256);

    function GAMMA_DISTRIBUTION_AMOUNT() external view returns (uint256);

    function alpha() external view returns (address);

    function alphaClaimed(uint256) external view returns (bool);

    function beta() external view returns (address);

    function betaClaimed(uint256) external view returns (bool);

    function claimDuration() external view returns (uint256);

    function claimStartTime() external view returns (uint256);

    function claimTokens() external;

    function claimUnclaimedTokens() external;

    function gamma() external view returns (address);

    function gammaClaimed(uint256) external view returns (bool);

    function getClaimableTokenAmount(address _account)
        external
        view
        returns (uint256);

    function grapesToken() external view returns (address);

    function owner() external view returns (address);

    function pauseClaimablePeriod() external;

    function paused() external view returns (bool);

    function renounceOwnership() external;

    function startClaimablePeriod(uint256 _claimDuration) external;

    function totalClaimed() external view returns (uint256);

    function transferOwnership(address newOwner) external;
}
