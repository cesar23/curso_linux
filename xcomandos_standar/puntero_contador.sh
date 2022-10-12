#!/bin/bash
# Create variable counter
COUNTER=0
echo "Initial value of COUNTER = "$COUNTER

# Basic Method
let COUNTER=COUNTER+1
echo "Output of COUNTER=COUNTER+ = "$COUNTER

# USE SHORTHAND METHOD
let COUNTER++
echo "Output of let COUNTER++ = "$COUNTER
