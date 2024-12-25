// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol"; // Import Foundry's standard testing utilities
import "../src/MyContract.sol"; // Import the contract to test

contract MyContractTest is Test {
    MyContract public myContract; // Instance of the contract to test

    // Runs before every test function
    function setUp() public {
        // Deploy the contract before each test
        myContract = new MyContract();
    }

    // Test if the value can be set correctly
    function testSetValue() public {
        uint256 testValue = 42; // Value to test with
        myContract.setValue(testValue); // Call the setValue function
        assertEq(myContract.value(), testValue, "The value should match the set value"); // Assert the result
    }

    // Test if the initial value is zero (default state)
    function testInitialValueIsZero() public {
        assertEq(myContract.value(), 0, "Initial value should be zero");
    }

    // Test if setting a value twice works
    function testSetValueTwice() public {
        uint256 firstValue = 10;
        uint256 secondValue = 20;

        myContract.setValue(firstValue); // Set the first value
        assertEq(myContract.value(), firstValue, "The value should be the first set value");

        myContract.setValue(secondValue); // Set the second value
        assertEq(myContract.value(), secondValue, "The value should now be the second set value");
    }
}
