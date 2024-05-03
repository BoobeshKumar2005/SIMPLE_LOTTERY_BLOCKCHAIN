require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    sepolia:{
      url:"https://sepolia.infura.io/v3/9daff4d9c5a8429da591b115ebfe205b",
      accounts:["43815ec5226e7d966d9cafc7268105f230a5befe00c9849e5de379ac14d13486"]
    },
    hardhat:{}
  }
};
