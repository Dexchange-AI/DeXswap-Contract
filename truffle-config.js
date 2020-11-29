const HDWalletProvider = require("@truffle/hdwallet-provider");
require('dotenv').config()

const { API_KEY, MNEMONIC } = process.env;
module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545, // Ganache GUI & CUI uses diff. port i.e. 7545 or 8545
      network_id: "*", // Match any network id
      gas: 5000000
    },
    mainnet: {
      provider: function () {
        return new HDWalletProvider(MNEMONIC, API_KEY)
      },
      network_id: 1,
      gas: 5500000,
      gasPrice: 84000000000,
      confirmations: 2,    
      timeoutBlocks: 200, 
      skipDryRun: false    
    }
  },
  compilers: {
    solc: {
      version: "0.6.10",
      settings: {
        optimizer: {
          enabled: true, // Default: false
          runs: 200 // Default: 200
        },
      }
    }
  }
}