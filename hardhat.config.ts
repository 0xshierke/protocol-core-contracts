import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.18",
  networks:{
    hardhat:{
      forking:{
        url:"https://eth-mainnet.g.alchemy.com/v2/_9FneSnR-nKwMxo4Hybym-e9VAyy139z"
      }
    }
  }
};

export default config;
