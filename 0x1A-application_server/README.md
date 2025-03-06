# Application Server Setup (0x1A)

## Overview
This project focuses on setting up an **Application Server** to serve dynamic content for the Airbnb Clone project. We will integrate **Gunicorn** with **Nginx** to ensure efficient request handling, improving performance, security, and scalability.

## Objectives
- Install and configure **Gunicorn** as an application server to handle Python application requests.
- Set up **Nginx** as a reverse proxy to efficiently direct requests.
- Deploy and serve the **Airbnb Clone** application dynamically.
- Implement **process management** for Gunicorn.
- Debug and optimize the server setup for reliability.

## Technologies Used
- **Ubuntu 16.04 LTS** – Operating System
- **Python 3** – Programming Language
- **Flask** – Web Framework for Python
- **Gunicorn** – WSGI HTTP Server for Python Applications
- **Nginx** – Web Server and Reverse Proxy
- **Upstart** – Process Management for services

## Installation & Setup

### 1. Install Dependencies
Update packages and install required software:
```bash
sudo apt update && sudo apt install -y python3-pip nginx
pip3 install flask gunicorn
```

### 2. Prepare the Flask Application
Ensure your Flask application (`app.py`) is structured correctly:
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, Airbnb Clone!"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
```

### 3. Run Flask App with Gunicorn
Start Gunicorn to serve the application:
```bash
gunicorn --workers 3 --bind 0.0.0.0:8000 app:app
```
- `--workers 3` – Uses three worker processes for handling requests.
- `--bind 0.0.0.0:8000` – Binds the application to port 8000.
- `app:app` – First `app` is the filename (`app.py`), second `app` is the Flask instance.

### 4. Configure Nginx as a Reverse Proxy
Create a new Nginx configuration file:
```bash
sudo nano /etc/nginx/sites-available/airbnb_clone
```
Add the following content:
```nginx
server {
    listen 80;
    server_name your_domain_or_IP;
    
    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
Enable the configuration and restart Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/airbnb_clone /etc/nginx/sites-enabled/
sudo systemctl restart nginx
```

### 5. Manage Gunicorn with Upstart
Create an Upstart script for Gunicorn:
```bash
sudo nano /etc/init/gunicorn.conf
```
Add the following content:
```bash
description "Gunicorn Daemon"
start on runlevel [2345]
stop on runlevel [!2345]
respawn
exec gunicorn --workers 3 --bind 0.0.0.0:8000 app:app
```
Start Gunicorn as a service:
```bash
sudo service gunicorn start
```

### 6. Enable Firewall Rules (Optional)
Allow HTTP and Gunicorn traffic:
```bash
sudo ufw allow 80/tcp
sudo ufw allow 8000/tcp
```

## Debugging & Logs
### Checking Gunicorn Logs
```bash
journalctl -u gunicorn --no-pager
```
### Checking Nginx Logs
```bash
tail -f /var/log/nginx/error.log
```
### Testing Nginx Configuration
```bash
sudo nginx -t
```
If errors are found, fix them before restarting Nginx.

## Conclusion
This setup ensures the **Airbnb Clone** application is efficiently served with **Gunicorn & Nginx**, providing scalability, performance, and security for handling web traffic in a production environment.

Author: Duncan Korir