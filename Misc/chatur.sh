#!/bin/bash

echo "Charut: Adarniya sabhapati mahodaya…"

echo "Rancho: isko suno, Raju k liye demo hai"

echo "Raju: Bhag yha se"

echo "Chatur: Pichle 32 saal se  . . . . "

echo "Raju: aj date kya hai"

echo "Rancho: $(date)"

echo "Frahan: Mujhe apne system ke space dekhi hai"

echo "Disk: $(df -h | awk 'NR==2 {print $2}') && $(free -h | awk 'NR==2 {print $2}')"


rank=1

echo "Rancho ke rank the $1"

echo "chatu ke rank kya the?"

#read -p "Rank bataoo:" rank

echo "chatu ke rank the $2"

echo "Raju ke rank $3"

echo "Farhan ke rank $4"

if [ $1 -eq "1" ];
then
	echo "Raju is Topper"
elif [ $2 -eq "1" ];
then
	echo "Chatur is Topper"
elif [ $3 -eq "1" ];
then
	echo "Raju is Topeer"
elif [ $4 -eq "1" ];
then
	echo "Farhan is Topeer"
fi


