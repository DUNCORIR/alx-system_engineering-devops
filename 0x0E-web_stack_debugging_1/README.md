Web Stack Debugging #1

Project Overview

Web Stack Debugging #1 is part of the journey to mastering the art of debugging web stacks. This project focuses on identifying and resolving issues in a web stack environment running on Ubuntu 20.04 LTS. You will practice debugging techniques, scripting, and ensure network and web services operate seamlessly.

General Requirements

Allowed editors: vi, vim, emacs

Environment: Ubuntu 20.04 LTS

All files must end with a new line

A README.md file at the root of the project folder is mandatory

All Bash scripts must:

Be executable

Pass Shellcheck without any error

Run without error

Start with #!/usr/bin/env bash

Include a second line with a comment explaining the purpose of the script

You are not allowed to use wget

Objectives

Understand and debug issues in a web stack.

Utilize scripting to automate repetitive tasks and resolve errors.

Gain hands-on experience with network basics and web service troubleshooting.

Files and Descriptions

Bash Scripts

File

Description

script_name_1

Script to check and restart a failing web server service

script_name_2

Script to monitor system resource usage and log the output

script_name_3

Script to debug HTTP status codes and server responses

Tools and Techniques

Debugging Tools

Shellcheck: For analyzing and fixing shell script issues.

System Monitoring: Tools like top, htop, df, and du to track resource usage.

Network Debugging: Using curl, telnet, ping, and netstat for connectivity checks.

Scripting Techniques

Use conditionals to handle errors gracefully.

Implement logging for better issue tracking.

Automate repetitive debugging tasks.

How to Run Scripts

Ensure the script is executable:

chmod +x <script_name>

Run the script:

./<script_name>

Debug any errors using:

bash -x <script_name>

Key Concepts

Network Basics

Verify connectivity using tools like ping and netcat.

Understand HTTP status codes (e.g., 200, 404, 500).

Web Stack Debugging

Check service logs for issues (/var/log/nginx/error.log, /var/log/syslog).

Ensure services are running using systemctl or service commands.

Debug reverse proxy configurations (e.g., nginx).

Challenges and Lessons Learned

Document any challenges faced during debugging and how you resolved them.

Author

Duncan Korir