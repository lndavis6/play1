// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "ds-test/test.sol";
import "../Stake.sol";
import "./mocks/MockERC20.sol";

contract Staket is DSTest {
    Stake public stakeContract;
    MockERC20 public mockERC20;

    function setUp() public {
        stakeContract = new Stake();
        mockERC20 = new MockERC20();
    }

    function testExample(uint8 amount) public {
        mockERC20.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockERC20));
        assertTrue(stakePassed);
    }
    
}