// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title EnergyToken (ECT)
 * @dev ERC-20 token representing energy credits (1 ECT = 1 kWh).
 * Only the contract owner (or authorized oracle) can mint or burn tokens.
 */
contract EnergyToken is ERC20, Ownable {

    constructor() ERC20("EnergyToken", "ECT") {}

    /**
     * @notice Mint new energy tokens
     * @param to The address receiving the newly minted tokens
     * @param amount The number of tokens to mint (1 token = 1 kWh)
     */
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    /**
     * @notice Burn energy tokens when energy is consumed or credits are redeemed
     * @param from The address whose tokens will be burned
     * @param amount The number of tokens to burn
     */
    function burn(address from, uint256 amount) external onlyOwner {
        _burn(from, amount);
    }
}
