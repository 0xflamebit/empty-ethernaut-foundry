// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Utils} from "test/utils/Utils.sol";

import {Impersonator, ECLocker} from "src/levels/Impersonator.sol";
import {ImpersonatorFactory} from "src/levels/ImpersonatorFactory.sol";
import {Level} from "src/levels/base/Level.sol";
import {Ethernaut} from "src/Ethernaut.sol";

contract TestImpersonator is Test, Utils {
    Ethernaut ethernaut;
    Impersonator instance;
    address payable owner;
    address payable player;

    bytes32 r = bytes32(uint256(11397568185806560130291530949248708355673262872727946990834312389557386886033));
    bytes32 s = bytes32(uint256(54405834204020870944342294544757609285398723182661749830189277079337680158706));
    uint8 v = 27;

    function setUp() public {
        address payable[] memory users = createUsers(2);

        owner = users[0];
        vm.label(owner, "Owner");

        player = users[1];
        vm.label(player, "Player");

        vm.startPrank(owner);
        ethernaut = getEthernautWithStatsProxy(owner);
        ImpersonatorFactory factory = new ImpersonatorFactory();
        ethernaut.registerLevel(Level(address(factory)));
        vm.stopPrank();

        vm.startPrank(player);
        instance = Impersonator(payable(createLevelInstance(ethernaut, Level(address(factory)), 0)));
        vm.stopPrank();
    }

    /// @notice Check the intial state of the level and enviroment.
    function testInit() public {
        ECLocker locker0 = instance.lockers(0);
        assertEq(locker0.lockId(), 1337);
        assertEq(locker0.controller(), 0x42069d82D9592991704e6E41BF2589a76eAd1A91);

        vm.startPrank(player);
        assertFalse(submitLevelInstance(ethernaut, address(instance)));
    }

    function testFail_TrySameSignatureOpen() public {
        vm.startPrank(player);
        ECLocker locker0 = instance.lockers(0);
        locker0.open(v, r, s);
    }

    function testFail_TrySameSignatureChangeController() public {
        vm.startPrank(player);
        ECLocker locker0 = instance.lockers(0);
        locker0.changeController(v, r, s, player);
    }

    function testFail_TryRandomSignatureChangeController() public {
        vm.startPrank(player);
        ECLocker locker0 = instance.lockers(0);
        locker0.changeController(28, r, bytes32(uint256(s) + 1), player);
    }

    /// @notice Test the solution for the level.
    function testSolve() public {
        // your code goes in this block
        vm.startPrank(player);



        // below line checks your code
        assertTrue(submitLevelInstance(ethernaut, address(instance)));
    }
}
