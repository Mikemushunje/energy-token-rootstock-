const hre = require("hardhat");

async function main() {
  const EnergyToken = await hre.ethers.getContractFactory("EnergyToken");
  const energyToken = await EnergyToken.deploy();
  await energyToken.deployed();

  console.log(`✅ EnergyToken deployed at: ${energyToken.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
