# 0x18. Webstack Monitoring

## 📌 Description
This project focuses on setting up monitoring for a web stack to ensure system reliability, detect issues, and optimize performance. You will learn how to monitor servers and applications, configure logging, and analyze logs for troubleshooting.

## 🏆 Learning Objectives
By the end of this project, you should be able to explain:
- Why monitoring is needed.
- The two main areas of monitoring (server and application monitoring).
- What access logs are for a web server (such as Nginx).
- What error logs are for a web server (such as Nginx).

## 📖 Resources
Read or watch:
- [What is server monitoring](https://www.datadoghq.com/blog/server-monitoring/)
- [What is application monitoring](https://www.datadoghq.com/blog/application-monitoring/)
- [System monitoring by Google](https://sre.google/sre-book/monitoring-distributed-systems/)
- [Nginx logging and monitoring](https://www.nginx.com/blog/logging-and-monitoring-nginx/)

## 🛠️ Technologies & Tools
- **Datadog** - Cloud-based monitoring tool.
- **Nginx** - Web server used in this project.
- **Prometheus & Grafana** (Alternative) - Open-source monitoring & visualization tools.
- **Linux (Ubuntu 20.04/22.04 recommended)**

## 🚀 Setup Instructions
### **1️⃣ Install Datadog Agent**
1. **Update system packages:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   ```
2. **Install the agent:**
   ```bash
   DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=<YOUR_API_KEY> DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
   ```
3. **Start the agent:**
   ```bash
   sudo systemctl start datadog-agent
   sudo systemctl enable datadog-agent
   ```
4. **Verify installation:**
   ```bash
   datadog-agent status
   ```

### **2️⃣ Configure Nginx Logging for Datadog**
1. Open the configuration file:
   ```bash
   sudo nano /etc/datadog-agent/conf.d/nginx.d/conf.yaml
   ```
2. Add:
   ```yaml
   logs:
     - type: file
       path: /var/log/nginx/access.log
       service: nginx
       source: nginx
     - type: file
       path: /var/log/nginx/error.log
       service: nginx
       source: nginx
   ```
3. Restart the Datadog Agent:
   ```bash
   sudo systemctl restart datadog-agent
   ```

## 📊 Monitoring Metrics
### **Common Nginx Metrics**
- `nginx.net.request_per_s` - Requests per second
- `nginx.net.connections` - Active connections
- `nginx.net.4xx` - Client errors
- `nginx.net.5xx` - Server errors

## 📌 Author
Duncan Korir