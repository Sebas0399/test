// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
//importar chainlink
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract OraclePattern {
    //Variable para almacenar la direccion del chainlink feed
    AggregatorV3Interface public s_priceFeed;
    address public owner;
    //Oracle Heart beat - tiempo de actualizacion
    //constante para el heartbeat
    uint256 public constant HEARTBEAT = 1 hours;
    //eth viene en wei, convertimos
    //factor de conversion
    uint256 public constant DECIMAL_FACTOR = 1 * 10 ** 20;
    //evento
    event ChainlinkFeedUpdate(address newFedd);
    //errores
    error OracleComprometido();
    error StatlePrice();
    error OnlyOwner();
    constructor(address _priceFeed) {
        s_priceFeed = AggregatorV3Interface(_priceFeed);
        owner = msg.sender;
    }
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert OnlyOwner();
        }
        _;
    }
    function getEthPrice() internal view returns (uint256 ethUSDPrice_) {
        ( /*uint80*/, int256 price, , uint256 updatedAt, ) = s_priceFeed
            .latestRoundData();
        if (block.timestamp - updatedAt > HEARTBEAT) {
            revert StatlePrice();
        }
        if (price <= 0) {
            revert OracleComprometido();
        }
        ethUSDPrice_ = uint256(price) * DECIMAL_FACTOR;
    }
}
