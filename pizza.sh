#!/bin/bash

printf "\033c" #clear the screen
s="size"; p="pan"; t="type"; sa="sauce"

function pause(){
   read -p "$*"
}

while true
do

printf "\033c" 
s=$((1 + RANDOM % 2))
printf "Size:    " -n
if ((s==1)) 
then
	echo "Regular"
	printf "Pan:     " -n
	echo "Deep Pan"
else
	echo "Extra Large"
	p="Regular"
	printf "Pan:     " -n
	echo "Regular"
fi;

t=$((1 + RANDOM % 2))
printf "Type:    " -n
if ((t==1)) 
then
	echo "Ham & Cheese"
	sa=0
else
	echo "Beef & Onion"
	sa=1
	printf "Sauce:   " -n
	echo "Hollandaise Sauce"
fi;

t=$((1 + RANDOM % 3))
printf "Crust:   " -n
if ((t==1)) 
then
	echo "Regular"
else if ((t==2))
then 
	echo "Cheesy"
else
	echo "Garlic"
fi;fi;

if ((sa!=1))
then
echo ""
fi

echo ""; pause 'Press [Enter] key to continue, or press ctrl+c'
done;
