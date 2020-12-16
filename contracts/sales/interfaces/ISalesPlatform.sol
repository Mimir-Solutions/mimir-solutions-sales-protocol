// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "hardhat/console.sol";

import "../dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "./storage/interfaces/ISalesDatastore.sol";
// import "../dependencies/holyzeppelin/contracts/token/ERC20/IERC20.sol";
// import "../dependencies/holyzeppelin/contracts/token/ERC20/SafeERC20.sol";

// import "../dependencies/uniswap-v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

import "./storage/interfaces/ISalesDatastore.sol";

contract SalesPlatform is Ownable {


    // TODO needs authorization integration to limit access to platform admin
    // TODO needs exchange listing tester to enable public registering of exchanges. This should confirm compatibility by minting 2 test tokens, listing, and attempting to trade. Can be implemented as an adaptor for later development
    function registerUniswapV2CompatiableExchange( address usv2cRouterddress_ ) public onlyOwner() {
        // Confirming that the submitted UniSwapV2 router address is a contract to prevent a wallet being added.
        require( usv2cRouterddress_.isContract() );
        // Adding UniSwapV2 factory address to mapping using router address as key.
        // _usv2cRouterToFactoryMapping[exhchangeRouterAddress_] = IUniswapV2Router02(usv2cRouterddress_).factory();
    }

    function registerSale( address saleToken_, uint256 saleTokenQPMultiplier_, address proceedsToken_, address uniswapV2CompatibleRouterddress_ )  public;
}