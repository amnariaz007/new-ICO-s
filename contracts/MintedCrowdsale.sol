// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Crowdsale.sol";

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


// MISS , MintedCrowd
abstract  contract MintedCrowdsale is Crowdsale , ERC20 {


    function deliverToken( address _beneficiary , uint256 _tokenAmount) public{
        ERC20._mint(_beneficiary, _tokenAmount);

    }





//   constructor(uint256 _rate, address _wallet, ERC20 _token) 
//   {
   

//     Crowdsale(_rate, _wallet, _token);
    
//   }

   
}
