#!/bin/bash

# Script: Ops 201 Class 04 Ops Challenge Solution 
# Author: 
# Date of latest revision:
# Purpose: 

# Create four directories

mkdir dir1 dir2 dir3 dir4

# Load each directory path into an array.

path_array=("./dir1" "./dir2/" "./dir3/" "./dir4" )

# Create a new .txt file within each directory
# by referencing the directory with array indices.
# not the literal directory path

touch "${path_array[0]}/file.txt"
touch "${path_array[1]}/file.txt"
touch "${path_array[2]}/file.txt"
touch "${path_array[3]}/file.txt"