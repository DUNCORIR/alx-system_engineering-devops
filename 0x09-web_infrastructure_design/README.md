 9. Web Infrastructure Design
Table of Contents
Project Overview
Learning Objectives
Concepts Covered
Network Basics
Server
Web Server
DNS (Domain Name System)
Load Balancer
Monitoring
Database
Web Server vs App Server
DNS Record Types
Single Point of Failure (SPOF)
Avoiding Downtime
High Availability Clusters
HTTPS
Firewall
Project Requirements
Author
Project Overview
In this project, we explore the design and implementation of web infrastructure. This includes understanding the components of a web stack, system redundancy, and how to optimize performance, security, and reliability.

Learning Objectives
By the end of this project, you should be able to:

Draw a diagram representing a web stack.
Explain the role and functionality of each component in the stack.
Understand and describe system redundancy.
Explain the following acronyms:
LAMP: Linux, Apache, MySQL, PHP.
SPOF: Single Point of Failure.
QPS: Queries Per Second.
Concepts Covered
1. Network Basics
A network connects devices to share resources and data.

IP Address: Unique identifier for devices.
IPv4 (e.g., 192.168.1.1)
IPv6 (e.g., 2001:0db8:85a3::8a2e:0370:7334)
Ports: Communication endpoints (e.g., Port 80 for HTTP, Port 443 for HTTPS).
Protocols:
TCP: Reliable, connection-oriented protocol.
UDP: Fast, connectionless protocol.
2. Server
A server is a powerful computer that provides data, services, or resources to clients over a network.

Web Server: Serves web content.
Database Server: Manages data.
Application Server: Executes business logic.
3. Web Server
A web server handles HTTP/HTTPS requests from clients and serves static or dynamic content.

Nginx: Lightweight, high-performance server.
Apache: Versatile, widely-used server.
4. DNS (Domain Name System)
DNS translates human-readable domain names into IP addresses.

A Record: Maps a domain to an IPv4 address.
CNAME Record: Alias of one domain to another.
5. Load Balancer
A load balancer distributes incoming traffic across multiple servers for high availability and fault tolerance.

Layer 4 (Transport Layer) Load Balancer: Balances traffic based on IP and port.
Layer 7 (Application Layer) Load Balancer: Balances traffic based on HTTP headers and cookies.
6. Monitoring
Monitoring tracks the performance, availability, and health of a system.

Key Metrics:

CPU usage
Memory usage
Response time
Error rates
Tools:

Prometheus
Nagios
Datadog
7. Database
A database is a structured collection of data.

Relational Databases (SQL): Use tables to store data (e.g., MySQL).
NoSQL Databases: Use non-tabular formats (e.g., MongoDB).
8. Web Server vs App Server
Web Server: Handles static content and HTTP requests.
App Server: Executes business logic and generates dynamic content.
9. DNS Record Types
Record Type	Description
A	Maps domain to IPv4 address.
AAAA	Maps domain to IPv6 address.
CNAME	Alias of another domain.
MX	Directs emails to mail servers.
10. Single Point of Failure (SPOF)
A SPOF is a component whose failure will bring down the entire system.

11. Avoiding Downtime
Blue-Green Deployment: Two identical environments, one live and one idle.
Rolling Deployment: Gradual rollout across servers.
Canary Deployment: Deploy to a small user subset first.
12. High Availability Clusters
Active-Active: All nodes handle traffic simultaneously.
Active-Passive: One node is active, and others are on standby.
13. HTTPS
HTTPS (HyperText Transfer Protocol Secure) encrypts data between the client and server using SSL/TLS.

14. Firewall
A firewall is a security device that monitors and controls incoming and outgoing network traffic based on predefined security rules.

Project Requirements
OS: Ubuntu 20.04 LTS.
Editors: vi, vim, emacs.
Makefile: Required for automation.
Diagrams: Illustrate web infrastructure design.
README.md: Comprehensive explanation of the project.
Author
Duncan Korir.
Email: duncorir@gmail.com
GitHub: duncorir
