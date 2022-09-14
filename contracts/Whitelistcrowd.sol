// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Crowdsale.sol";
import "./Whitelist.sol";


/**
 * @title WhitelistedCrowdsale
 * @dev Crowdsale in which only whitelisted users can contribute.
 */
abstract contract WhitelistedCrowd is  Crowdsale , Whitelist {
  /**
   * @dev Extend parent behavior requiring beneficiary to be in whitelist.
   * @param _beneficiary Token beneficiary
   * @param _weiAmount Amount of wei contributed
   */
  function _preValidatePurchase (address _beneficiary,uint256 _weiAmount) internal  virtual pure override
 {

  
    super._preValidatePurchase(_beneficiary, _weiAmount);
  }

}