import { ethers } from "hardhat";

async function main() {
  
  const TestUsdc = await ethers.getContractFactory("TestUSDC");
  const TestWeth = await ethers.getContractFactory("TestWETH");
  const tUsdc = await TestUsdc.deploy();
  const tWeth = await TestWeth.deploy();

  await tUsdc.deployed();
  await tWeth.deployed();
  console.log(`tUsdc CA:${tUsdc.address},tWeth CA:${tWeth.address}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
