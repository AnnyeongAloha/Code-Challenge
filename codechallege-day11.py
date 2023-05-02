# OPS401 Code Challenge day-11 
# Author: Justin 'Sage Odom' Tabios
# Made from ChatGPT

# Purpose: In Python, create a TCP Port Range Scanner that tests whether a TCP port is open or closed. The script must:

# Utilize the scapy library
# Define host IP
# Define port range or specific set of ports to scan
# Test each port in the specified range using a for loop
# If flag 0x12 received, send a RST packet to graciously close the open connection. Notify the user the port is open.
# If flag 0x14 received, notify user the port is closed.
# If no flag is received, notify the user the port is filtered and silently dropped.

from scapy.all import *

# Define the target host IP address
target_host = "192.168.1.1"

# Define the port range to scan
start_port = 1
end_port = 100

# Loop through each port and test if it is open or closed
for port in range(start_port, end_port+1):
    # Send SYN packet to the target host and port
    response = sr1(IP(dst=target_host)/TCP(dport=port, flags="S"), timeout=1, verbose=0)
    
    # Check the response flags to determine the state of the port
    if response is None:
        print(f"Port {port} is filtered or silently dropped")
    elif response.haslayer(TCP) and response.getlayer(TCP).flags == 0x12:
        # Send RST packet to gracefully close the connection
        send(IP(dst=target_host)/TCP(dport=port, flags="R"), verbose=0)
        print(f"Port {port} is open")
    elif response.haslayer(TCP) and response.getlayer(TCP).flags == 0x14:
        print(f"Port {port} is closed")
    else:
        print(f"Port {port} is filtered or silently dropped")
