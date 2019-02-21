#!/bin/bash
#
# This script produces the dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Improve this script by using the value in the automatic variable $USER for the name
# Improve this script by adding some time and day of the week information to the welcome message
#   Use a format like this:
#   It is HH:MM AM on weekday.

###############
# Variables   #
###############
title="Overlord"
myname="AngelROB"
hostname=$(hostname)
NOW=$(date +'%c')
day=$(date +"%A")

###############
# Main        #
###############
#cat <<EOF
#oPutt="Welcome to planet $hostname, "$title $USER!" current time is $NOW on $day"
#cowsay  $(oPutt)
cowsay "Welcome to planet $hostname, "$title $USER!" current time is $NOW on $day"
#EOF
