#!/bin/bash -x
#Program for Flip Coin Simulator
#Variables
H=0
T=0
HH=0
HT=0
TH=0
TT=0
HHH=0
TTT=0
HTH=0
HHT=0
THH=0
HTT=0
THT=0
TTH=0

declare -A coinDictionarySinglet
declare -A coinDictionaryDoublet
declare -A coinDictionaryTriplet

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

#function to get Triplet Combination
function getTripletCombination()
{
	read -p "How many times do you want to flip a coin for Triplet Combination?:" NoOfFlips3
	for((count=1;count<=$NoOfFlips3 * 3;count++))
	do
		outcome=$((RANDOM%8))
		case $outcome in
			0) coinDictionaryTriplet[HHH]=$((${coinDictionaryTriplet[HHH]}+1)) ;;
			1) coinDictionaryTriplet[TTT]=$((${coinDictionaryTriplet[TTT]}+1)) ;;
			2) coinDictionaryTriplet[HTH]=$((${coinDictionaryTriplet[HTH]}+1)) ;;
			3) coinDictionaryTriplet[HHT]=$((${coinDictionaryTriplet[HHT]}+1)) ;;
			4) coinDictionaryTriplet[THH]=$((${coinDictionaryTriplet[THH]}+1)) ;;
			5) coinDictionaryTriplet[HTT]=$((${coinDictionaryTriplet[HTT]}+1)) ;;
			6) coinDictionaryTriplet[THT]=$((${coinDictionaryTriplet[THT]}+1)) ;;
			7) coinDictionaryTriplet[TTH]=$((${coinDictionaryTriplet[TTH]}+1)) ;;
		esac
	done

	#Print the dictionary for Triplet Combination
	for key in "${!coinDictionaryTriplet[@]}"
	do
		echo ""${key}" : "${coinDictionaryTriplet[$key]}""
	done

	#Calculating percentage of Triplet combination
	HHHpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[HHH]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "HHH percentage ::" $HHHpercentage

	TTTpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[TTT]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "TTT percentage ::" $TTTpercentage

	HTHpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[HTH]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "HTH percentage ::" $HTHpercentage

	HHTpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[HHT]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "HHT percentage ::" $HHTpercentage

	THHpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[THH]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "THH percentage ::" $THHpercentage

	HTTpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[HTT]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "HTT percentage ::" $HTTpercentage

	THTpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[THT]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "THT percentage ::" $THTpercentage

	TTHpercentage=`echo " scale = 4 ; (${coinDictionaryTriplet[TTH]}*100)/($NoOfFlips3*3)" | bc -l`
	echo "TTH percentage ::" $TTHpercentage
}

getSingletCombination
getDoubletCombination
getTripletCombination
