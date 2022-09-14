// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Crowdsale.sol";


contract DappTokenCrowdsale is Crowdsale {

  constructor(
    uint256 _rate, 
    address _wallet,
    ERC20 _token
  )
    Crowdsale(_rate, _wallet, _token)
   
  {

  }
}