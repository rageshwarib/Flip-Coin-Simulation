#!/bin/bash -x
#Program for Flip Coin Simulator
#Variables
H=0
T=0
HH=0
HT=0
TH=0
TT=0

declare -A coinDictionarySinglet
declare -A coinDictionaryDoublet

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

#Function to get Doublet Combination
function getDoubletCombination()
{
	read -p "How many times do you want to flip a coin for doublet combination?:" NoOfFlips2
	for((count=1;count<=$NoOfFlips2 * 2;count++))
	do
		outcome=$((RANDOM%4)) 
		case $outcome in 
			0) coinDictionaryDoublet[HH]=$((${coinDictionaryDoublet[HH]}+1)) ;;
			1) coinDictionaryDoublet[HT]=$((${coinDictionaryDoublet[HT]}+1)) ;;
			2) coinDictionaryDoublet[TH]=$((${coinDictionaryDoublet[TH]}+1)) ;;
			3) coinDictionaryDoublet[TT]=$((${coinDictionaryDoublet[TT]}+1)) ;;
		esac
	done

	# Print the dictionary for doublet combination
	for key in "${!coinDictionaryDoublet[@]}"
	do
		echo ""${key}" : "${coinDictionaryDoublet[$key]}""
	done

	# Print the percentages of doublet combinations
	HHpercentage=`echo " scale = 4 ; (${coinDictionaryDoublet[HH]}*100)/($NoOfFlips2*2)" | bc -l`
	echo "HH percentage ::" $HHpercentage

	HTpercentage=`echo " scale = 4 ; (${coinDictionaryDoublet[HT]}*100)/($NoOfFlips2*2)" | bc -l`
	echo "HT percentahe ::" $HTpercentage

	THpercentage=`echo " scale = 4 ; (${coinDictionaryDoublet[TH]}*100)/($NoOfFlips2*2)" | bc -l`
	echo "TH percentage ::" $THpercentage

	TTpercentage=`echo " scale = 4 ; (${coinDictionaryDoublet[TT]}*100)/($NoOfFlips2*2)" | bc -l`
	echo "TT percentage ::" $TTpercentage
}

getSingletCombination
getDoubletCombination
