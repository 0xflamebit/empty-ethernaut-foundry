// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "../levels/Reentrance.sol";

interface Reentrance {
    function balances(address) external returns (uint256);
    function donate(address) external payable;
    function balanceOf(address) external returns (uint256);
    function withdraw(uint256) external;
}

contract ReentranceAttack {}
