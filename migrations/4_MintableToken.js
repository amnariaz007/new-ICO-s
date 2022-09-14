const MintableToken = artifacts.require("MintableToken");

module.exports = function(deployer) {
  deployer.deploy(MintableToken );
};
