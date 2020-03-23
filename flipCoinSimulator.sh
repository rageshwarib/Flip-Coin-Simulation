#!/bin/bash -x
#Program for Flip Coin Simulator

outcome=$((RANDOM%2))
if [[ $outcome == 1 ]]
then
	echo "Heads"
else
	echo "Tails"
fi
