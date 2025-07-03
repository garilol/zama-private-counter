import { ethers } from "hardhat";

async function main() {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying from:", deployer.address);

  const Factory = await ethers.getContractFactory("PrivateCounter");
  const counter = await Factory.deploy();
  await counter.waitForDeployment();

  console.log("Contract address:", await counter.getAddress());
}

main().catch((e) => { console.error(e); process.exit(1); });
