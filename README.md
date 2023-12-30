# Dollars exchanging system

## Overview

This is a simple currency converter program written in assembly language. The program takes an input in dollars and converts it to either Egyptian pounds or AED based on user input. It accepts 250$ as maximum at a time due to registers size limitation. Future updates may support more currencies exchange.

## Features

- Converts dollars to Egyptian pounds or AED selection.
- Simple and easy-to-understand assembly code.
- Accepts user input for target currency then for the amount in dollars to be exchanged.


## program flow

First users is asked to choose from menu either 1 or 2. Then asked to enter the value to be exchanged in dollars. Then simply the output result we be printed on screen. Other flow may arise if user enters a number greater than 2, will cause program to send an invalid message and ask user to  prompt 1 or 2 again.
ex program run example:
```
one digit example

- User enters 1 for Egyptian Pounds, then prompt 001. Program will do calculations and print 32
```
```
Two digit example

- User enters 1 for Egyptian Pounds, then prompt 010. Program will do calculations and print 320
```
```
Three digit example

- User enters 1 for Egyptian Pounds, then prompt 100. Program will do calculations and print 3200
```
