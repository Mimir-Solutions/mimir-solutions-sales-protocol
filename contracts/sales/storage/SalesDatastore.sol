// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.7.5;

import "hardhat/console.sol";

import "../../dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "../../dependencies/holyzeppelin/contracts/security/Context.sol";

contract SalesDatastore is Ownable {
    
    using Address for address;
    // using SafeERC20 for IERC20;

    modifier onlySalesPlatform() {
        require( Context._msgSender() == salesPlatform );
        _;
    }

    address public salesPlatform;
    mapping( bytes32 => address ) _usv2Exchanges;

    constructor() {}

    // TODO needs to be updated to use Authorization platform.
    // TODO needs to be set to platform admin role.
    function setSalesPlatform( address salesPlatform_ ) external onlyOwner() {

    }

    /**
     * Intended to provide a small UUID style identifier generated from the minimum amount of date needed to uniquely identify a sale.
     * Because UniswapV2 compatible exchanges use a router contract as the primary
     */
    function encodeUSV2CExchangeID(address usv2Router_) public view returns ( bytes32 usv2ExchangeID_ ) {
        require( usv2Router_.isContract() );
        return _encodeUSV2CExchangeID( usv2Router_);
    }

    // Internal function provided to optimize gas for internal calls;
    function _encodeUSV2CExchangeID(address usv2Router_) internal pure returns ( bytes32 usv2ExchangeID_ ) {
        return bytes32(uint256(usv2Router_));
    }

    // TODO needs to be updated to use Authorization platform.
    // TODO needs to be set to SalesPlatform role.
    function registerUSV2CExchange( address usv2cRouter_ ) public onlySalesPlatform() returns ( bytes32 usv2ExchangeID_ ) {
        require( usv2cRouter_.isContract() );
        require( bytes32(uint256(_usv2Exchanges[_encodeUSV2CExchangeID( usv2cRouter_ )])) == 0 );
        _usv2Exchanges[_encodeUSV2CExchangeID( usv2cRouter_ )] = usv2cRouter_;
        return _encodeUSV2CExchangeID( usv2cRouter_ );
    }

    /**
     * Intended to provide a small UUID style identifier generated from the minimum amount of date needed to uniquely identify a sale.
     * Because UniswapV2 compatible exchanges use a router contract as the primary
     */
     // TODO Needs an event.
    // function encodeSaleID(address saleToken_, address proceedsToken_, address uniswapV2CompatibleRouterddress_) public pure returns ( bytes32 ) {
    //     return _encodeSaleID(saleToken_, proceedsToken_, uniswapV2CompatibleRouterddress_);
    // }
}