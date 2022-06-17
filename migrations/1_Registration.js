const Registration = artifacts.require("Registration.sol");

export default function (deployer) {
  deployer.deploy(Registration);
};