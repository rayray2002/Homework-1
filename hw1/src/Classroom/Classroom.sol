// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/console.sol";

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint8 public count = 0;

    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        if (count == 0) {
            count = 1;
            return 1000;
        } else {
            return 123;
        }
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        IClassroomV2 classroomV2 = IClassroomV2(msg.sender);
        if (classroomV2.isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        uint256 gas = gasleft();
        if (gas > 7000) {
            return 1000;
        } else {
            return 123;
        }
    }
}
