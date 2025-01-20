Load Balancer Project

Description

This project involves setting up and configuring web servers with a load balancer using HAProxy. It includes:

Configuring custom HTTP headers (X-Served-By).

Setting up HAProxy to distribute traffic across multiple servers.

Concepts

Load Balancer: Distributes incoming traffic across multiple servers to improve availability and performance.

Web Stack Debugging: Diagnosing and fixing issues within the web stack (frontend, backend, and server).

HTTP Headers: Used to send additional information about requests and responses.

Requirements

All scripts written in Bash.

Tested and executed on Ubuntu 16.04 LTS.

Scripts must pass ShellCheck 0.3.7 without errors.

Files

File

Description

0-custom_http_response_header

Configures an Ubuntu server with Nginx and a custom HTTP header.

haproxy.cfg

HAProxy configuration file to enable load balancing.

Usage

Configure web servers with 0-custom_http_response_header.

Set up HAProxy to balance traffic across servers.

Test the custom header with curl:

curl -sI <server-ip> | grep X-Served-By

Author

Duncan Korir