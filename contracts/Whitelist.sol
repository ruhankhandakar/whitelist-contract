//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.17;

contract Whitelist {
    uint8 public maxWhiteListedAddresses;

    mapping(address => bool) public whiteListedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhiteList() public {
        // Check is the user has already been whitelisted
        require(!whiteListedAddresses[msg.sender], "Sender has already been whitelisted");

        // Check if the numAddressesWhitelisted < maxWhiteListedAddresses, if not then throw an error
        require(numAddressesWhitelisted < maxWhiteListedAddresses, "More addreses can't be added, limit reached");

        // Add the address which called the function to the whiteListedAddresses object
        whiteListedAddresses[msg.sender] = true;

        // Increase the number of whitelisted address
        numAddressesWhitelisted += 1;
    }
}