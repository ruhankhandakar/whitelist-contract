const { ethers } = require('hardhat');

async function main() {
  /* 
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts.
  so whiteListedContact here is a factory for instances of our Whitelist contract
  */
  const whiteListContract = await ethers.getContractFactory('Whitelist');

  // Here we deploy the contract
  // 10 is the Maximum number of whitelisted addresses allowed (_maxWhiteListedAddresses)
  const deployedWhitelistContract = await whiteListContract.deploy(10);

  // Wait for it to finish deploying
  await deployedWhitelistContract.deployed();

  // print the address of the deployed contract
  console.log(
    'Whitelist Contract Address: ',
    deployedWhitelistContract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log('Error', error);
    process.exit(1);
  });
