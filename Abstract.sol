// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
abstract contract AbstractContract {
    address public s_myaddress;
    constructor() {}
    function foo() external virtual returns (uint256);
}
contract MyConctract is AbstractContract {
    function foo() external pure override returns (uint256) {
        return 100;
    }
}
