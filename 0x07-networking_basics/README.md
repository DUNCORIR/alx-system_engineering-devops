Network0x07. Networking basics #0
DevOps
Network

 OSI Model Basics
Definition: A model that defines how network communication should happen in layers, helping different networking protocols work together.
Layers: 7 in total:
Physical: Physical connection and transmission of raw data (cables, switches).
Data Link: Error-free data transfer between two nodes (MAC addresses, switches).
Network: Manages data routing and addressing (IP addresses, routers).
Transport: Ensures data delivery with TCP/UDP protocols.
Session: Manages sessions and connections.
Presentation: Translates data into a format usable by the application (encryption, compression).
Application: Interfaces with the end-user (HTTP, FTP).
2. LAN and WAN
LAN (Local Area Network):
Usage: For small areas (single building or campus).
Commonly uses Ethernet or Wi-Fi.
WAN (Wide Area Network):
Usage: Connects multiple LANs across larger geographic areas (e.g., between cities or countries).
Often uses leased lines, MPLS, or the Internet.
3. IP Address Basics
Definition: A unique address that identifies a device on a network.
Types:
Private IP: Restricted to local networks; not routable on the internet.
Public IP: Used for internet-facing devices, routable on the internet.
4. Localhost
Refers to the local machine itself, typically at IP address 127.0.0.1. Useful for testing network applications on your own device.
5. IPv4 and IPv6
IPv4: 32-bit addressing, limited to about 4.3 billion addresses (e.g., 192.168.1.1).
IPv6: 128-bit addressing, allowing a vastly larger number of addresses, using a hexadecimal format (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334).
6. TCP vs. UDP
TCP:
Reliable, connection-oriented, ensures data integrity.
Used for applications where accurate data transfer is crucial (e.g., HTTP, FTP).
UDP:
Fast, connectionless, no guarantee of data delivery.
Suitable for real-time applications like video streaming or gaming.
7. Ports to Memorize
SSH: 22
HTTP: 80
HTTPS: 443
8. Ping and ICMP
Ping: A command-line tool to check if a device is reachable on the network.
Uses the ICMP protocol to send an "echo request" and waits for an "echo reply."
Useful Commands
netstat: Displays active network connections, routing tables, and network statistics.
ping: Used to test network connectivity by sending packets to a specified IP address.
