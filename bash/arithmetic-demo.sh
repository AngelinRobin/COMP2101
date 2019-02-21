#!/bin/bash
#
# this script demonstrates doing arithmetic

# Improve this script by asking the user to supply the two numbers
# Improve this script by demonstrating using subtraction and multiplication
# Improve this script by demonstrating the modulus operation
#   - the output should look something like:
#   - first divided by second gives X with a remainder of Y
# Improve this script by calculating and displaying the first number raised to the power of the second number

echo "Enter two integers: "

read -p firstnum: firstnum
read -p secondnum: secondnum
sum=$((firstnum + secondnum))
sub=$((firstnum - secondnum))
mul=$((firstnum * secondnum))
mod=$((firstnum % secondnum))
pow=$((firstnum ** secondnum))
dividend=$((firstnum / secondnum))
fpdividend=$(awk "BEGIN{printf \"%.2f\", $firstnum/$secondnum}")

cat <<EOF
$firstnum plus $secondnum is $sum
$firstnum minus $secondnum is $sub
$firstnum multiplied $secondnum is $mul
$firstnum divided by $secondnum is $dividend
$firstnum divided by $secondnum gives $dividend with a remainder of $mod
- More precisely, it is $fpdividend
$firstnum raised to the power of the $secondnum is $pow
EOF
