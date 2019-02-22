#!/bin/bash
# This script demonstrates testing variables

# Test if the USER variable exists
# TASK 1: Add a command that prints out a labelled description of what is in the USER variable, but only if it is not empty
[ ! -z USER ] && echo "$USER"
# TASK 2: Add a command that tells the user if the USER variable exists, but is empty
[ -z USER ] && echo "The variable SHELL exists but its empty"
[ -v USER ] && echo "The variable SHELL exists"

# Tests for string data
# TASK 3: Modify the command to use the != operator instead of the = operator, without breaking the logic of the command
[ $a != $b ] && echo "$a is not alphanumerically equal to $b" || echo "$a is alphanumerically equal to $b"
# TASK 4: Use the read command to ask the user running the script to give us strings to use for the tests
read -p "Enter String1:" s1
read -p "Enter String2:" s2
[ $s1 = $s2 ] && echo "$s1 is alphanumerically equal to $s2" || echo "$s1 is not alphanumerically equal to $s2"

a=1
b=01
[ $a = $b ] && echo "$a is alphanumerically equal to $b" || echo "$a is not alphanumerically equal to $b"
