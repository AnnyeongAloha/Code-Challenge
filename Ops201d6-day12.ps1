# Script: Ops 201 Class 12 Ops Code Challenge Solution
# Author: Justin 'Sage' Tabios
# Date of latest revision: 21 Feb 2023
# Purpose: Create a local file called network_report.txt and return only the IP version 4 address.

$ip_output = ipconfig >> "network_report.txt"
$reset_dhcp = ipconfig /release; ipconfig /renew


Function myfunc {
  $ip_output
  $reset_dhcp
  $ip_output
}

myfunc
