# Local Server: 648211-web-01

## Overview
This document provides details about the local server setup, including its purpose, configuration, and usage.

---

## Server Details
| **Name**        | **Username** | **IP Address**     | **State**  |
|------------------|--------------|--------------------|------------|
| 648211-web-01    | ubuntu       | 34.204.101.142     | Pending    |

---

## Features
- **OS**: Ubuntu (pending confirmation of version)
- **Purpose**: General server setup for SSH learning and development.
- **Configuration**:
  - SSH enabled on port 22.
  - RSA public-key authentication.
  - Basic tools installed (TBD).

---

## Setup Steps
1. **Connect to the server**:
   
    ssh ubuntu@34.204.101.142
2.Initial updates and upgrades:

sudo apt update && sudo apt upgrade -y

3.Secure SSH Configuration:
    Disable password authentication:

        sudo nano /etc/ssh/sshd_config
    Set PasswordAuthentication no.
    Restart SSH service:

        sudo systemctl restart sshd

Future Enhancements
    Install and configure Nginx or Apache.
    Set up a basic web application for testing.
    Implement additional security measures (e.g., UFW, Fail2Ban).

Notes
    Ensure your SSH private key is stored securely.
    Backup configurations regularly.

Author
Created by Duncan Korir  