// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";


contract Stake{

    error TransferFailed();

    mapping(address => mapping(address => uint256)) public s_balances;

    function stake(uint256 amount, address token) external returns(bool){
        s_balances[msg.sender][token] += amount;
        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert TransferFailed();
        return success;
    }

}