const DappTokenCrowdsale = artifacts.require("DappTokenCrowdsale");

module.exports = function (deployer) {
  deployer.deploy(DappTokenCrowdsale);
};
