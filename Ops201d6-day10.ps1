# Script: Ops 201 Class 10 Ops Challenge Solution 
# Author: Justin Tabios
# Date of latest revision:
# Purpose:

# Print to the terminal screen all active processes ordered by highest CPU time consumption at the top.
# Print to the terminal screen all active processes ordered by highest Process Identification Number at the top.
# Print to the terminal screen the top five active processes ordered by highest Working Set (WS(K)) at the top.
# Start the process Internet Explorer (iexplore.exe) and have it open https://owasp.org/www-project-top-ten/.
# Start the process Internet Explorer (iexplore.exe) ten times using a for loop. Have each instance open https://owasp.org/www-project-top-ten/.
# Close all Internet Explorer windows.
# Kill a process by its Process Identification Number. Choose a process whose termination won’t destabilize the system, such as Internet Explorer or MS Edge.

# Referring to MarcoGPT: 

# Main
#Scrip prins all active processes ordered by highest CPU time consumption to lowest
GET-Process | Sort-Object CPU -Descending | Format-Table Name, CPU -AutoSize

#Script prints all active processes ordered by PID
GET-Process | Sort-Object Id -Descending | Format-table Name, Id -Autosize

#Print to the screen the top five active processes ordered by highest working set
GET-Process | Sort-Object Workingset -Descending | Select -First 5  Name, Workingset | Format-Table -Autosize

#This script that loads a website with iexplorer
Start-Process "iexplore.exe" -ArgumentList "https://owasp.org/www-project-top-ten/"

#Same as above but in chrome cuz ie sucks lol
Start-Process "chrome.exe" -ArgumentList "https://owasp.org/www-project-top-ten/"

#This script uses a for loop that starts with an 1 intenger and goes up by one everytime it run
for ( $i = 1; $i -le 10; $i++ ) { Start-Process "iexplore.exe" -ArgumentList "https://owasp.org/www-project-top-ten/" }

#for chrome cuz its better
for ( $i = 1; $i -le 10; $i++ ) { Start-Process "chrome.exe" -ArgumentList "https://owasp.org/www-project-top-ten/" }

#closes Browsers (not fully functional)
$wndws = Get-Process iexplore -ErrorAction SilentlyContinue
>>  foreach ($wndw in $wndws ) { $wndw.CloseMainWindow() }

#kill a process by PID
Get-Process | Select-Object Name, Id -First 20
>> $pidKill = Read-Host "Enter the PID of the process you wish to KILL!!!!"
>> Stop-Process -Id $pidKill -Force

#End
