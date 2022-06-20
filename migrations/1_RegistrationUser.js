const RegistrationUser = artifacts.require("RegistrationUser.sol");

module.exports = function (deployer) {
  deployer.deploy(RegistrationUser);
};