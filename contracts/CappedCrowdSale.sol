// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "./Crowdsale.sol";
import "./MintedCrowdsale.sol";
import "openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Capped.sol";



abstract contract CappedCrowdsale is Crowdsale, ERC20Capped   {

  // Track investor contributions
  uint256 public investorMinCap = 2000000000000000; // 0.002 ether
  uint256 public investorHardCap = 50000000000000000000; // 50 ether
  mapping(address => uint256) public contributions;

  constructor(
    uint256 _rate,
    address _wallet,
    ERC20 _token,
    uint256 _cap
  )
    Crowdsale(_rate, _wallet, _token)
    ERC20Capped(_cap)
    // public
  {

  }

  /**
  * @dev Returns the amount contributed so far by a sepecific user.
  * @param _beneficiary Address of contributor
  * @return User contribution so far
  */
  function getUserContribution(address _beneficiary)
    public view returns (uint256)
  {
    return contributions[_beneficiary];
  }

  /**
  * @dev Extend parent behavior requiring purchase to respect investor min/max funding cap.
  * @param _beneficiary Token purchaser
  * @param _weiAmount Amount of wei contributed
  */
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
    override
   pure
  {

    // super._mint(_beneficiary, _weiAmount);
    //  super._preValidatePurchase(_beneficiary, _weiAmount);
    // uint256 _existingContribution = contributions[_beneficiary];
    // // uint256 _newContribution = _existingContribution.add(_weiAmount);
    // require(_newContribution >= investorMinCap && _newContribution <= investorHardCap);
    // contributions[_beneficiary] = _newContribution;
  }

}