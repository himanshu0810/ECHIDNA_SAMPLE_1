// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";
import {Token} from "../src/token.sol";

contract TestToken is Token {
    
    constructor() {
        paused();
        owner = address(0);
    }

    function echidna_test_pausauble() public returns(bool) {
        return is_paused;
    }
 
  
}
