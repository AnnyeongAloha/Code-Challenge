$ip_output = ipconfig >> "network_report.txt"
$reset_dhcp = ipconfig /release; ipconfig /renew


Function myfunc {
  $ip_output
  $reset_dhcp
  $ip_output
}

myfunc
