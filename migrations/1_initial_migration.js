const Migrations = artifacts.require("Migrations");
const OFPI = artifacts.require("OFPI");
module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(OFPI);
};
