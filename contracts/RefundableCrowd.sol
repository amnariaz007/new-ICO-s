// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


import "./math/SafeMath.sol";
import "./FinalizableCrowdsale.sol";

import "./RefundEscrow.sol";


/**
 * @title RefundableCrowdsale
 * @dev Extension of Crowdsale contract that adds a funding goal, and
 * the possibility of users getting a refund if goal is not met.
 */
abstract contract RefundableCrowd is FinalizableCrowdsale , RefundEscrow {
  using SafeMath for uint256;
    

  // minimum amount of funds to be raised in weis
  uint256 public goal;

  // refund escrow used to hold funds while crowdsale is running
   RefundEscrow private  escrow;

  /**
   * @dev Constructor, creates RefundEscrow.
   * @param _goal Funding goal
   */
  constructor(uint256 _goal)  {
    require(_goal > 0);
    //  escrow = new RefundEscrow(wallet);
    RefundEscrow(wallet);
    goal = _goal;
  }

  /**
   * @dev Investors can claim refunds here if crowdsale is unsuccessful
   */
  function claimRefund() public view  {
    require(isFinalized);
    require(!goalReached());
   
  }

  /**
   * @dev Checks whether funding goal was reached.
   * @return Whether funding goal was reached
   */
  function goalReached() public view returns (bool) {
    return weiRaised >= goal;
  }

  /**
   * @dev escrow finalization task, called when owner calls finalize()
   */
  function finalization() internal override  {
    if (goalReached()) {
      escrow.close();
      escrow.beneficiaryWithdraw();
    } else {
      escrow.enableRefunds();
    }

    super.finalization();
  }

  /**
   * @dev Overrides Crowdsale fund forwarding, sending funds to escrow.
   */
  function _forwardFunds() internal {
    //  escrow.deposit.value(msg.value)(msg.sender);
  }

}