UFW Firewall Configuration

Project Overview

This project involves setting up and configuring the UFW (Uncomplicated Firewall) on the web-01 server to enhance security by blocking all incoming traffic except for essential services.

Requirements

The following rules must be applied to web-01:

Block all incoming traffic by default.

Allow incoming traffic on TCP ports:

22 (SSH) for remote access.

80 (HTTP) for web traffic.

443 (HTTPS) for secure web traffic.

The configuration should be done carefully to prevent being locked out of the server.

Steps to Implement

SSH into the server:

ssh ubuntu@<server-ip>

Install UFW:

sudo apt update && sudo apt install ufw -y

Allow SSH access before enabling UFW:

sudo ufw allow 22/tcp

Set default policies:

sudo ufw default deny incoming
sudo ufw default allow outgoing

Allow essential ports:

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

Enable UFW:

sudo ufw enable

Check status:

sudo ufw status verbose

Safety Precautions

Always allow port 22 before enabling UFW to prevent being locked out.

If locked out, use the AWS console or a recovery method to regain access.

Script for Automation

To automate the process, create a script 0-block_incoming_traffic with the following content:

#!/usr/bin/env bash
sudo apt update && sudo apt install ufw -y
sudo ufw allow 22/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status verbose

Make it executable and run it:

chmod +x 0-block_incoming_traffic
./0-block_incoming_traffic

Author

Duncan KorirUFW Firewall Configuration

Project Overview

This project involves setting up and configuring the UFW (Uncomplicated Firewall) on the web-01 server to enhance security by blocking all incoming traffic except for essential services.

Requirements

The following rules must be applied to web-01:

Block all incoming traffic by default.

Allow incoming traffic on TCP ports:

22 (SSH) for remote access.

80 (HTTP) for web traffic.

443 (HTTPS) for secure web traffic.

The configuration should be done carefully to prevent being locked out of the server.

Steps to Implement

SSH into the server:

ssh ubuntu@<server-ip>

Install UFW:

sudo apt update && sudo apt install ufw -y

Allow SSH access before enabling UFW:

sudo ufw allow 22/tcp

Set default policies:

sudo ufw default deny incoming
sudo ufw default allow outgoing

Allow essential ports:

sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

Enable UFW:

sudo ufw enable

Check status:

sudo ufw status verbose

Safety Precautions

Always allow port 22 before enabling UFW to prevent being locked out.

If locked out, use the AWS console or a recovery method to regain access.

Script for Automation

To automate the process, create a script 0-block_incoming_traffic with the following content:

#!/usr/bin/env bash
sudo apt update && sudo apt install ufw -y
sudo ufw allow 22/tcp
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status verbose

Make it executable and run it:

chmod +x 0-block_incoming_traffic
./0-block_incoming_traffic

Author

Duncan Korir
