const DeXswap = artifacts.require("DeXswap");

module.exports = function (deployer) {
  deployer.deploy(DeXswap);
};
