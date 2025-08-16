// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import './Lib.sol';

contract useLib{
    function calculateSquare(uint x) public pure returns (uint){

        return  Lib.square(x);
    }
}