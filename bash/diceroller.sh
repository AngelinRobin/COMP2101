#!/bin/bash
#
# this script rolls a pair of six-sided dice
#

# Improve this script by adding a second line of output showing a roll of 5 six-sided dice
# Improve this script by adding a third line of output that rolls a single 20-sided die
# These improvements should also take into consideration the user, and make all 3 output lines self-explanatory to the user
#    - e.g. the first line should be changed to read something like:
#         Rolling a pair of standard dice: x,y rolled
#      and the other output lines should be similarly helpful to the user

# roll the dice and display the result
echo "
Rolling a pair of six sided dice...
$(( RANDOM % 6 + 1)), $(( RANDOM % 6 + 1 )) rolled
"


# roll more dice and display the result
echo "
Rolling a five six sided dice...
$(( RANDOM % 6 + 1))
$(( RANDOM % 6 + 1 ))
$(( RANDOM % 6 + 1 ))
$(( RANDOM % 6 + 1 ))
$(( RANDOM % 6 + 1 ))
"



# roll the 20 sided and display the result
echo "
Rolling a 20 sided dice...
$(( RANDOM % 20 + 1)) rolled
"
