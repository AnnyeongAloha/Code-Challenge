#!/bin/bash

# Script: Ops 201 Class 13 Ops Challenge Solution
# Author: Justin 'Sage' Tabios
# Date of latest revision: 02/22/2023
# Purpose: 


#Referred to Tyler's script for this portion
# Main
echo -e "Please choose a command: \nwhois\ndig \nhost \nnslookup"
read command

echo "Please enter a file name:"
read filetype

# Prompt the user for a domain name
echo "Please enter a domain name:"
read domain


#Referred to challenge06 for this script, Mahalo Tyler and Mola for the tip and reference
cont_var=1

while [[ $cont_var -eq 1 ]]; do 
     
    if [[ $command == "whois" ]]; then
        whois $domain > $filetype
        cont_var=0
    elif [[ $command == "dig" ]]; then
        dig $domain > $filetype
        cont_var=0
    else 
        [[ $command == "nslookup"; then
         nslookup $domain > $filestype
        cont_var=0
    fi 
    
done 

# End
