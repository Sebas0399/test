// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract Loop {
    function calculateSum(uint256 _number) public pure {
        uint256 sum = 0;
        for (uint256 i = 1; i <= _number; i++) {
            sum += 1;
        }
    }
}
