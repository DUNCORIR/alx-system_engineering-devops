0x08. Networking basics #1
DevOps
Network
SysAdmin

Key Resources and Concepts
What is localhost and 127.0.0.1?
localhost: A hostname that points to the current device.
127.0.0.1: The loopback IP address used to route traffic back to the local device, ideal for testing and diagnostics.
Generally, localhost and 127.0.0.1 are used interchangeably for tasks involving the local network.
What is 0.0.0.0?
0.0.0.0: A special address used to refer to all IP addresses on the local machine. When a server binds to this address, it listens for connections on all available IPv4 interfaces.
What is the /etc/hosts file?
A local file that maps IP addresses to hostnames, allowing you to define custom network mappings.
Used to resolve hostnames without querying an external DNS server, useful for testing and quick access to custom mappings.
Key Commands
ifconfig
Displays network interfaces and settings like IP addresses, netmasks, and MAC addresses.
Usage: ifconfig shows all active network interfaces.
telnet
A protocol and command used for remote communication with servers, often for testing services.
Syntax: telnet <hostname> <port> connects to the specified hostname and port.
nc (Netcat)
A powerful networking tool for reading and writing data over network connections.
Examples:
nc -l -p <port>: Listens on a specified port.
nc <hostname> <port>: Connects to a specified host and port.
cut
Extracts sections from lines of text, useful for processing output from other commands.
Example: cut -d ' ' -f1 extracts the first field in each line, using spaces as the delimiter.
Learning Objectives
Understanding localhost and 127.0.0.1
localhost points to the device itself, with 127.0.0.1 as the IP for the loopback interface.
Understanding 0.0.0.0
0.0.0.0 represents "all IPv4 addresses" on the device, often used for services that need to accept incoming connections on any network interface.
Understanding /etc/hosts
A file for custom IP-to-hostname mappings, useful for testing local network setups.
Displaying Active Network Interfaces
Use ifconfig (or ip a on some systems) to view details of all active network interfaces.
Sample Task Ideas
Edit /etc/hosts:

Add an entry, e.g., 127.0.0.1 mylocaltest, and test by running ping mylocaltest.
Use Netcat for a Simple Client-Server Setup:

Open a listening port: nc -l -p 1234.
In a separate terminal, connect to it with nc localhost 1234 to test basic connectivity.
Check Network Interfaces:

Run ifconfig (or ip a) to view details such as IPs and netmasks of each network interface.
