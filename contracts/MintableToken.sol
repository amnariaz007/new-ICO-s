// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


// import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


/**
 * @title DetailedERC20 token
 * @dev The decimals are only for visualization purposes.
 * All the operations are done using the smallest and indivisible token unit,
 * just as on Ethereum all the operations are done in wei.
 */
contract MintableToken  {
  string private _name;
  string private _symbol;
  uint8 private decimals_;


   constructor(string memory name_, string memory symbol_ , uint8 _decimals)  {
         _name = name_;
         _symbol = symbol_;
         decimals_ = _decimals;


    }

        function name() public view virtual  returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual  returns (string memory) {
        return _symbol;
    }

 function decimals() public view virtual  returns (uint8) {
        return decimals_ ;
    }
  

}


