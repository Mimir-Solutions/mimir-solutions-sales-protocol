// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.0;

import "hardhat/console.sol";

import "./dependencies/holyzeppelin/contracts/access/Ownable.sol";
import "./dependencies/uniswap-v2-core/contracts/UniswapV2Factory.sol";

contract UniswapV2CompatiableTokenLister is Ownable {

    constructor() {}

    // function createPair( address token1_, address token2_ ) external onlyOwner() returns ( address listingPairAddress_ ) {
    //     return address( _uniswapFactoryV2Factory.createPair( token1_, token2_ ) );
    // }

    function _depositInUniswap() private {
        // totalWeiPaidForEris = _weth.balanceOf( address(this) );
        // totalWeiPaidForEris = _testToken.balanceOf( address(this) );
        // _balances[address(_uniswapV2ErisWETHDEXPair)] = FinancialSafeMath.bondingPrice( _totalSupply.div(totalWeiPaidForEris), _totalSupply ).mul(_erisToEthRatio).div(1e2);
        // _weth.transfer( address(_uniswapV2ErisWETHDEXPair), _weth.balanceOf( address(this) ) );
        // _testToken.transfer( address(_uniswapV2ErisWETHDEXPair), _testToken.balanceOf( address(this) ) );
        // _uniswapV2ErisWETHDEXPair.mint(address(this));
        // _totalLPTokensMinted = _uniswapV2ErisWETHDEXPair.balanceOf(address(this));
        // require(_totalLPTokensMinted != 0 , "No LP deposited");
        // _lpPerETHUnit = _totalLPTokensMinted.mul(1e18).div(totalWeiPaidForEris);
        // require(_lpPerETHUnit != 0 , "Eris:292:_depositInUniswap(): No LP deposited");
    }
}