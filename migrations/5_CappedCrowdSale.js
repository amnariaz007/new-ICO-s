const CappedCrowdsale = artifacts.require("CappedCrowdsale");

module.exports = function (deployer) {
  deployer.deploy(CappedCrowdsale);
};
