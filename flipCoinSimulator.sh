#!/bin/bash -x
#Program for Flip Coin Simulator
#Variables
H=0
T=0

declare -A coinDictionarySinglet

#Function to get Singlet Combination
function getSingletCombination()
{
	#Storing singlet combination of heads and tails in dictionary 
	read -p "How many times you want to flip a Coin for Singlet Combination::" NoOfFlips1
	for((count=1;count<=$NoOfFlips1;count++))
	do
		outcome=$((RANDOM%2))
		case $outcome in
			0) coinDictionarySinglet[H]=$((${coinDictionarySinglet[H]}+1)) ;;
			1) coinDictionarySinglet[T]=$((${coinDictionarySinglet[T]}+1)) ;;
   	esac
	done

	#Print the dictionary of singlet combination
	for key in "${!coinDictionarySinglet[@]}"
	do
		echo ""${key}" : "${coinDictionarySinglet[$key]}"" 
	done

	#Calculating percentage of Singlet combination
	headPercentage=`echo " scale = 4 ; (${coinDictionarySinglet[H]}*100)/($NoOfFlips1)" | bc -l`
	tailPercentage=`echo " scale = 4 ; 100-$headPercentage" | bc -l`
	echo "Percentage of heads ::" $headPercentage
	echo "Percentage of tails ::" $tailPercentage
}
getSingletCombination
