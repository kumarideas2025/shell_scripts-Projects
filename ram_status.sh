#!/bin/bash

#awk ----> arranged data in column order .


FREE_Space=$(free -mt | grep "Total" | awk '{print $4}')

# TH(threash hold)--->this to measure how much memory we get alert.
TH=500

if [[ $FREE_Space -lt $TH ]]
then
	echo "WARNING, Ram is running low"
else
	echo "RAM space is sufficient :$FREE_Space M"
fi
