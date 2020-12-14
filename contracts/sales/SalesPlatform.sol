// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "hardhat/console.sol";

import "../dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "../dependencies/holyzeppelin/contracts/token/ERC20/IERC20.sol";
import "../dependencies/holyzeppelin/contracts/token/ERC20/SafeERC20.sol";

import "../dependencies/uniswap-v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

import "./storage/interfaces/ISalesDatastore.sol";

contract SalesPlatform is Ownable {

    using Address for address;
    using SafeERC20 for IERC20;

    constructor() {}

    // TODO needs authorization integration to limit access to platform admin
    // TODO needs exchange listing tester to enable public registering of exchanges. This should confirm compatibility by minting 2 test tokens, listing, and attempting to trade. Can be implemented as an adaptor for later development
    function registerUniswapV2CompatiableExchange( address usv2cRouterddress_ ) public onlyOwner() {
        // Confirming that the submitted UniSwapV2 router address is a contract to prevent a wallet being added.
        require( usv2cRouterddress_.isContract() );
        /*
        Confirming that the submitted UniswapV2 router address is a UniswapV2 compliant timplementation.
        Not exhaustive. But since UniswapV2 predates ERC165 no good way exists to confirm compliance.
        But be manuall reviewed prior to addition.
        The intent of this function to provided minimal preotection against platform admin malfeasance or error.
        */
        require( IUniswapV2Router02(usv2cRouterddress_).factory() != 0 );
        // Adding UniSwapV2 factory address to mapping using router address as key.
        _usv2cRouterToFactoryMapping[exhchangeRouterAddress_] = IUniswapV2Router02(usv2cRouterddress_).factory();
    }

    /**
     * Sales for Ethereum will use the WETH token address.
     *  might need to save WETH address and use IWETH interface.
     */
    // TODO Sales will need to check if proceedsToken_ is the WETH address and accept Ethereum to automatically convert to WETH.
    // TODO needs to confirm _msgSender() has correct role to register sale.
    // TODO needs an event.
    // TODO check fasibility of moving to independent datatore.
    function registerSale( address saleToken_, uint256 saleTokenQPMultiplier_, address proceedsToken_, address uniswapV2CompatibleRouterddress_ )  public {
        require(_usv2cRouterToFactoryMapping[uniswapV2CompatibleRouterddress_] != 0, "QPLGMESalePlatform not compaitble with this exchange.");

        bytes32 saleID_ = _encodeSaleID(saleToken_, proceedsToken_, uniswapV2CompatibleRouterddress_);

        // _saleDataMapping[saleID_].saleActive = false;
        // _saleDataMapping[saleID_].listerAddress = Context._msgSender();
        // _saleDataMapping[saleID_].tokenForSale = tokenForSale_;
        // _saleDataMapping[saleID_].saleTokenQPMultiplier = saleTokenQPMultiplier_;
        // _saleDataMapping[saleID_].proceedsToken = proceedsToken_;
        // _saleDataMapping[saleID_].tokenListing.uniswapV2CompatibleRouter = IUniswapV2Router02(uniswapV2CompatibleRouterddress_);
        // _saleDataMapping[saleID_].tokenListing.uniswapVsCompatibleFactory = IUniswapV2Factory(_uniswapV2CompatibleExchangeRouterToFactoryMapping[uniswapV2CompatibleRouterddress_]);

        // _listToken(saleID_);
    }
}