import "@fhevm/hardhat-plugin";
import "@nomicfoundation/hardhat-ethers";
import dotenv from "dotenv";
dotenv.config();

export default {
  solidity: "0.8.24",
  networks: {
    zama: {
      url: process.env.RPC_URL,
      chainId: 8009,
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
