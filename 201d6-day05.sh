#!/bin/bash

# Script: Ops 201 Class 02 Ops Challenge Solution 
# Author: 
# Date of latest revision:
# Purpose: Write a script that displays running processes, asks the user for a PID, then kills the process with that PID.For this part of the lab, initialize a process that won’t harm the OS’s functionality upon termination. Don’t kill essential processes required for the OS to work, such as kernel drivers.
#Use a loop in your script.This loop will facilitate the menu system of your script, so that it can prompt the user to choose an option.

#Main
import os

def display_running_processes():
    # Get a list of running processes
    process_list = [p for p in os.popen("ps -e").read().split("\n") if p]
    
    # Print the header
    print("PID\tProcess")
    
    # Print the processes
    for process in process_list[1:]:
        pid, name = process.split(" ", 1)
        print(f"{pid}\t{name}")

def kill_process(pid):
    os.system(f"kill {pid}")

while True:
    print("\nProcess Manager")
    print("1. Display running processes")
    print("2. Kill a process")
    print("3. Exit")
    choice = int(input("Enter your choice: "))
    
    if choice == 1:
        display_running_processes()
    elif choice == 2:
        pid = input("Enter the PID of the process to kill: ")
        kill_process(pid)
    elif choice == 3:
        break
    else:
        print("Invalid choice. Try again.")
#End

#this script was made ChatGPT