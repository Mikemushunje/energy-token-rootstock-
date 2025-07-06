 EnergyToken: Tokenized Energy Microgrid Payments on Rootstock

This repository contains a decentralized energy tokenization system built on the Rootstock blockchain. It demonstrates how smart contracts can automate billing and payments in microgrids, addressing inefficiencies in traditional energy payment systems.

Table of Contents

1.  [Introduction](#introduction)
2.  [Features](#features)
3.  [Why Rootstock?](#why-rootstock)
4.  [What You'll Build](#what-youll-build)
5.  [Prerequisites & Tech Stack](#prerequisites--tech-stack)
6.  [Project Folder Structure](#project-folder-structure)
7.  [Smart Contract: EnergyToken.sol](#smart-contract-energytokensol)
8.  [Deployment to Rootstock Testnet](#deployment-to-rootstock-testnet)
9.  [Smart Meter Simulation with Oracle Logic](#smart-meter-simulation-with-oracle-logic)
10. [Tokenomics Design](#tokenomics-design)
11. [Payment Lifecycle Diagram](#payment-lifecycle-diagram)
12. [Testing & Interacting with the Contract](#testing--interacting-with-the-contract)
13. [FAQ & Troubleshooting](#faq--troubleshooting)

---

## 1. Introduction

As the global energy landscape rapidly evolves, microgrids are becoming a crucial piece of decentralized energy infrastructure — particularly in remote areas, developing economies, and emerging smart cities. Microgrids allow communities, businesses, and households to generate, store, and trade energy locally, reducing dependence on national grids.
However, one persistent problem remains: Billing, payments, and settlements inside microgrids are still inefficient, manual, and error-prone.
The Problem: Inefficiencies in Microgrid Payments
* Payment Delays: Energy producers often wait days or weeks for payment due to complex verification and billing cycles.
* Administrative Overhead: Meter readings, invoices, and reconciliations often require human input or centralized third parties.
* High Transaction Fees: Payments processed through traditional banking rails or mobile money systems add unnecessary fees.
* Limited Trust: In many regions, participants do not trust centralized operators to handle billing or settlements fairly.

The Solution: Programmable, Tokenized Billing
By introducing blockchain-based tokenization, we can remove many of these pain points entirely:
* Real-time settlement: Payments occur automatically as energy is generated or consumed.
* Smart contract enforcement: Billing logic is encoded on-chain, eliminating disputes and reducing administrative overhead.
* Decentralized trust: The blockchain provides a transparent, immutable record of all transactions, fostering trust among participants.
* Lower transaction costs: Direct peer-to-peer payments on the blockchain can significantly reduce fees compared to traditional intermediaries.

## 2. Features

* **ERC-20 Energy Credit Token (ECT)**: Represents energy units (1 token = 1 kWh) for real-time settlement.
* **Automated Billing Logic**: Encoded on-chain via smart contracts, reducing disputes and administrative overhead.
* **Permissioned Minting & Burning**: Ensures only authorized entities (like a verified oracle) can issue or destroy tokens, maintaining integrity.
* **Smart Meter Simulation**: A Node.js script simulates real-world energy readings and triggers token minting as an oracle layer.
* **Bitcoin-Secured**: Leverages Rootstock's connection to the Bitcoin network for maximum security and trustlessness.

## 3. Why Rootstock?

Rootstock (RSK) is an ideal platform for this solution because it combines the security of Bitcoin with the flexibility of Ethereum's EVM-compatible smart contracts.

**Key Advantages:**

| Feature                | Why It’s Ideal for Energy Grids                                 |
| :--------------------- | :-------------------------------------------------------------- |
| Bitcoin Security       | Energy-critical infrastructure demands maximum trustlessness.   |
| Low Gas Fees           | Frequent micro-payments for energy credits stay cost-effective. |
| EVM Compatible         | Solidity, Hardhat, and existing Ethereum tooling work natively. |
| Ecosystem Tools        | Supports MetaMask, Chainlink, IPFS, and more.                   |

## 4. What You'll Build

In this guide, you will learn how to create:

* An ERC-20 Energy Credit Token representing energy units (1 token = 1 kWh).
* A smart meter simulation that triggers token minting based on usage data.
* A deployable smart contract using Solidity and Hardhat.
* An optional tokenomics model to govern how tokens are issued, burned, and circulated.
* A complete developer-ready GitHub repository with code, diagrams, and setup instructions.

By the end, you will have a fully functioning decentralized energy tokenization system built entirely on Rootstock.

5. Prerequisites & Tech Stack

Before diving into coding, ensure you have a complete and functional development environment.

* **Node.js (LTS version)**: Provides the JavaScript runtime for blockchain development tools like Hardhat and Ethers.js.
    * [Download Node.js](https://nodejs.org/en/download/)
* **Hardhat**: A smart contract development framework for compiling, deploying, testing, and debugging Solidity contracts on EVM-compatible blockchains.
    * Installation: `npm install --save-dev hardhat`
* **MetaMask**: A browser wallet for signing transactions, deploying contracts, and interacting with the Rootstock blockchain.
    * [Install MetaMask](https://metamask.io/download/)
    * **Custom Rootstock Testnet RPC Setup:** Add the following network to MetaMask:
        | Setting        | Value                           |
        | :------------- | :------------------------------ |
        | Network Name   | Rootstock Testnet               |
        | RPC URL        | `https://public-node.testnet.rsk.co` |
        | Chain ID       | `31`                            |
        | Symbol         | `tRBTC`                         |
        | Block Explorer | `Rootstock Testnet Explorer`    |
* **OpenZeppelin Contracts**: Provides battle-tested, audited implementations of token standards like ERC-20, ensuring security and compliance.
    * Installation: `npm install @openzeppelin/contracts`
* **Rootstock Testnet Faucet**: Provides free `tRBTC` (testnet RBTC) for development purposes, needed to pay for gas fees.
    * [Claim testnet funds here](https://faucet.rootstock.io/)


## 6. Project Folder Structure

We follow an organized, professional folder structure:

/energy-token
/contracts
└── EnergyToken.sol
/scripts
└── deploy.js
/simulations
└── simulateMeter.js
/diagrams
└── energy-flow.png  
.env
.env.example
README.md
package.json
hardhat.config.js





## 7. Smart Contract: EnergyToken.sol

This is the core of our decentralized energy payment system. It's an ERC-20 token where each token represents 1 kilowatt-hour (kWh) of energy.

**Key Logic:**

* **Permissioned Minting and Burning**: The `onlyOwner` modifier ensures that only the contract deployer can mint or burn tokens, allowing integration with verified oracles and preventing unauthorized inflation or malicious burning.
* **ERC-20 Compliance**: Inherits from OpenZeppelin's audited libraries for full ERC-20 compliance and security against common attacks.
* **Direct Mapping to Energy Flow**: `mint()` reflects energy produced, and `burn()` reflects energy consumed, keeping the token supply synchronized with real-world energy.
* **Token Details**: `EnergyToken` (name), `ECT` (symbol), `18` (decimals for fractional kWh).

## 8. Deployment to Rootstock Testnet

Once the `EnergyToken` contract is written, the next step is to deploy it to Rootstock Testnet.

### 8.1 Configure Hardhat RPC for Rootstock

Update `hardhat.config.js` to include the Rootstock Testnet network.

### 8.2 Secure Private Key with `.env`

Create a `.env` file in your project root to store your private key securely. **DO NOT commit this file to GitHub.**

Also, create a `.env.example` as a template.

### 8.3 Write Deployment Script: `deploy.js`

Create `scripts/deploy.js` to automate the contract deployment.

### 8.4 Run the Deployment

Execute the deployment script using Hardhat:

```bash
npx hardhat run scripts/deploy.js --network rootstock_testnet

Copy and save the 0xYourDeployedContractAddress output.
8.5 Verify Deployment on Rootstock Testnet Explorer
Paste your deployed contract address into the Rootstock Testnet Explorer to verify its status and transactions.
9. Smart Meter Simulation with Oracle Logic
This stage simulates a smart meter acting as an oracle, automating the minting of EnergyToken based on energy usage.
To run the simulation:
node simulations/simulateMeter.js

10. Tokenomics Design
The EnergyToken operates with a dynamic supply model, minting tokens only when verified energy production events occur (1 token = 1 kWh). Minting rights are currently controlled by the onlyOwner modifier for simplicity, with a view to future integration with oracle data verification or DAO governance. Burning mechanisms remove tokens when energy is consumed or credits are redeemed, aligning supply with grid activity.
 * Supply Model: Dynamic Supply (Elastic) - mints tokens only when energy is produced (1 token = 1 kWh).
 * Mint Authority: onlyOwner (simulated oracle).
 * Burn Logic: On consumption/redemption.
 * Circulation Flow: [Producer] -> Mint Tokens -> [Consumer] -> Burn Tokens -> [Grid Operator] -> Redeem Rewards
 * Incentives: Can include bonus tokens for producers, rebates for consumers, and rewards for developers.
 * Governance: Owner-controlled, with a DAO-ready upgrade path for future decentralization.
11. Payment Lifecycle 

 * Smart Meter: Captures real-time energy data (e.g., kWh) and sends it to the Oracle/API layer.
 * Oracle / API: Processes energy data, validates usage against thresholds (e.g., 10 kWh), and triggers the Smart Contract.
 * Smart Contract (EnergyToken.sol): Contains logic for minting or burning EnergyTokens, triggered by the Oracle/API, and updates User Wallet balances.
 * User Wallet: Holds EnergyTokens for producers and consumers, enabling peer-to-peer transactions.
 * Frontend & Smart Contract Interface: Provides a dashboard UI for users, interacts with the smart contract, and reflects updated token balances.
12. Testing & Interacting with the Contract
After deployment, you can verify contract functionality using Hardhat Console and MetaMask.
Prerequisites:
 * Contract deployed on Rootstock Testnet.
 * .env file configured with PRIVATE_KEY.
 * Rootstock Testnet added to MetaMask.
12.1 Run Hardhat Console
npx hardhat console --network rootstock_testnet

12.2 Load the Contract in Console
const [deployer] = await ethers.getSigners();
const EnergyToken = await ethers.getContractFactory("EnergyToken");
const token = await EnergyToken.attach("0xYourDeployedContractAddress"); // <-- UPDATE THIS!

12.3 Test: Minting Tokens
await token.mint(deployer.address, ethers.utils.parseEther("10"))

Verify the transaction in MetaMask.
12.4 Test: Checking Balance
ethers.utils.formatEther(await token.balanceOf(deployer.address))
// Expected output: "10.0"

12.5 Test: Burning Tokens
await token.burn(deployer.address, ethers.utils.parseEther("5"))

Then check your balance again:
ethers.utils.formatEther(await token.balanceOf(deployer.address))
// Expected output: "5.0"


13. FAQ & Troubleshooting
 * Why is my token not showing up in MetaMask?
   * Manually add the token to MetaMask: Import Tokens -> Paste contract address -> Symbol: ECT, Decimals: 18.
   * Ensure you are on Rootstock Testnet and have minted tokens to your wallet.
 * How do I simulate usage data from smart meters?
   * Use the provided simulateMeter.js script. For production, consider IoT MQTT brokers, CSV imports, or RESTful API calls.
 * My RPC connection failed during deployment.
   * Check .env for correct PRIVATE_KEY and ROOTSTOCK_RPC_URL.
   * Try npx hardhat clean then npx hardhat compile.
   * Use public RSK Testnet RPC: https://public-node.testnet.rsk.co.
   * If network is congested, try again in 5–10 mins.
 * I get an error: “caller is not the owner” when minting tokens.
   * Only the contract deployer (owner) can call mint(). Ensure your connected wallet is the deployer, or transfer ownership.
 * The mint() or burn() transaction is stuck or pending forever.
   * Possible causes: Low gas fee, Rootstock Testnet congestion, incorrect nonce.
   * Fixes: Manually increase gas via MetaMask, reset account in MetaMask settings, or use a fresh nonce.




