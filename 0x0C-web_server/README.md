# 0x0C. Web Server

## Description
This project focuses on setting up a basic web server, understanding how the web works, and managing a web server on a Linux system. It includes tasks such as transferring files, configuring Nginx, and understanding DNS and HTTP requests.

## Learning Objectives
At the end of this project, you should be able to:

### General
- Understand the main role of a web server.
- Explain the concept of child processes and why web servers usually have parent and child processes.
- Know the main HTTP requests and their purposes.

### DNS
- Define DNS and its main role.
- Understand common DNS record types such as A, CNAME, TXT, and MX.

## Requirements
- All files should be interpreted on Ubuntu 16.04 LTS.
- Each script must pass Shellcheck (version 0.3.7) without errors.
- Scripts must be executable and begin with `#!/usr/bin/env bash`.
- No use of `systemctl` for restarting a process.

## Resources
Here are some useful resources:

- [How the Web Works](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/How_the_Web_works)
- [Nginx](https://www.nginx.com/resources/wiki/)
- [How to Configure Nginx](https://docs.nginx.com/nginx/admin-guide/web-server/)
- [Child Process Concept](https://en.wikipedia.org/wiki/Child_process)
- [DNS Record Types](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
- [HTTP Requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
- [HTTP Redirection](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections)

## Tasks

### 0. Transfer a file to your server
Write a Bash script that transfers a file from a local client to a remote server.

#### Requirements:
- Accepts 4 parameters:
  1. Path to the file to transfer
  2. IP address of the server
  3. Username for SSH connection
  4. Path to the SSH private key
- Displays usage instructions if fewer than 4 parameters are provided.
- Transfers the file to the user's home directory (`~/`) on the server.
- Disables strict host key checking during the transfer.

Example:
```bash
./0-transfer_file some_file 192.168.1.2 username ~/.ssh/private_key
```

### 1. Install and configure Nginx
Set up an Nginx web server on a Linux machine and serve content from a custom directory.

#### Requirements:
- Install `nginx` using your package manager.
- Configure the default Nginx server to serve a static HTML file.
- Reload Nginx to apply changes without restarting.

### 2. Add a custom domain
Point a custom domain to your server by updating its DNS records.

#### Requirements:
- Create an `A` record pointing to your server's IP address.
- Verify the domain resolves correctly.

## Author
Duncan Korir