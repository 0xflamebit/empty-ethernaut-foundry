// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import {Utils} from "test/utils/Utils.sol";

import {Stake} from "src/levels/Stake.sol";
import {StakeFactory} from "src/levels/StakeFactory.sol";
import {StakeAttack} from "src/attacks/StakeAttack.sol";
import {Level} from "src/levels/base/Level.sol";
import {Ethernaut} from "src/Ethernaut.sol";
import {ERC20} from "openzeppelin-contracts-08/token/ERC20/ERC20.sol";

import {console} from "forge-std/console.sol";
contract TestStake is Test, Utils {
    Ethernaut ethernaut;
    Stake instance;

    address payable owner;
    address payable player;

    function setUp() public {
        address payable[] memory users = createUsers(2);

        owner = users[0];
        vm.label(owner, "Owner");

        player = users[1];
        vm.label(player, "Player");

        vm.startPrank(owner);
        ethernaut = getEthernautWithStatsProxy(owner);
        StakeFactory factory = new StakeFactory();
        ethernaut.registerLevel(Level(address(factory)));
        vm.stopPrank();

        vm.startPrank(player);
        instance = Stake(payable(createLevelInstance(ethernaut, Level(address(factory)), 0.001 ether)));
        vm.stopPrank();
    }

    /// @notice Check the intial state of the level and enviroment.
    function testInit() public {
        vm.startPrank(player);
        assertFalse(submitLevelInstance(ethernaut, address(instance)));
    }

    /// @notice Test the solution for the level.
    function testSolve() public {
        // your code goes in this block
        vm.startPrank(player);



        // below line checks your code
        assertTrue(submitLevelInstance(ethernaut, address(instance)));
    }
}
