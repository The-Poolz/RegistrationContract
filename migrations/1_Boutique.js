const Boutique = artifacts.require("Boutique .sol");

module.exports = function (deployer) {
  deployer.deploy(Boutique);
};