// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "hardhat/console.sol";

import "../../../../dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "../../../../dependencies/holyzeppelin/contracts/token/ERC20/IERC20.sol";
import "../../../../dependencies/holyzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract UniSwapV2CompatiableSaleManagerAdaptor is Ownable {

    using Address for address;
    using SafeERC20 for IERC20;

    constructor() {}
}