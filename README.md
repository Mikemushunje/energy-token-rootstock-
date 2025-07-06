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
* **GitHub**: Required for submission per Hacktivator 2.0 rules, containing your contract, scripts, README, and diagrams.

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

