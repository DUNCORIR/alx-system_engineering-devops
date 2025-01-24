0x10. HTTPS SSL
DevOps | SysAdmin | Security
This project focuses on understanding and implementing HTTPS and SSL configurations, with practical applications in DNS, web stack debugging, and HAProxy configuration.

Learning Objectives
By the end of this project, you should be able to:

General Concepts
What is HTTPS and SSL?

HTTPS (Hypertext Transfer Protocol Secure) is the secure version of HTTP, ensuring encrypted communication over a network.
SSL (Secure Sockets Layer) or TLS (Transport Layer Security) are cryptographic protocols that secure communication between a client (browser) and server.
2 Main Roles of HTTPS SSL

Encryption: Protects data in transit, ensuring that sensitive information like passwords, credit card details, and personal data cannot be intercepted by attackers.
Authentication: Verifies the identity of the server, ensuring users are connecting to the legitimate website and not a malicious one.
Purpose of Encrypting Traffic

Prevents eavesdropping, tampering, and man-in-the-middle attacks by ensuring data remains private and secure during transmission.
What SSL Termination Means

SSL termination occurs when encrypted traffic (HTTPS) is decrypted at the load balancer (e.g., HAProxy) before being passed as plain HTTP traffic to the backend servers.
This reduces the computational load on backend servers while maintaining secure communication with clients.
Key Resources
What is HTTPS?
HTTPS ensures secure communication and builds trust by encrypting traffic and verifying server authenticity.
What are the 2 Main Elements of SSL?
Encryption and Authentication.
HAProxy SSL Termination on Ubuntu 16.04
Practical guide to implementing SSL termination with HAProxy.
Useful Commands
awk: For text processing and pattern matching within configuration files.
dig: For DNS query troubleshooting.
Practical Tasks
1. HAProxy SSL Termination
Configure HAProxy to terminate SSL traffic.
Ensure HAProxy listens on port 443 for HTTPS traffic, decrypts it, and forwards it to the backend server.
Use certbot to generate SSL certificates.
Key Commands:

bash
Copy
Edit
sudo apt update && sudo apt install haproxy certbot
sudo certbot certonly --standalone -d www.duncorir.tech
2. HTTP to HTTPS Redirection
Configure HAProxy to automatically redirect HTTP traffic (port 80) to HTTPS (port 443) with a 301 Moved Permanently response.
Ensure the redirection is transparent to users.
HAProxy Configuration Example:

haproxy
Copy
Edit
frontend http_front
    bind *:80
    redirect scheme https code 301 if !{ ssl_fc }

frontend https_front
    bind *:443 ssl crt /etc/letsencrypt/live/www.duncorir.tech/fullchain.pem \
        crt-key /etc/letsencrypt/live/www.duncorir.tech/privkey.pem
    default_backend web_backend

backend web_backend
    server web1 127.0.0.1:8080 check
3. DNS and Web Debugging
Ensure your domain points to the correct IP address using DNS records.
Use dig to verify DNS configurations:
bash
Copy
Edit
dig www.duncorir.tech
4. Validation
Verify HTTPS using curl:
bash
Copy
Edit
curl -I https://www.duncorir.tech
Confirm redirection from HTTP to HTTPS:
bash
Copy
Edit
curl -I http://www.duncorir.tech
Deliverables
1-haproxy_ssl_termination

HAProxy configuration for SSL termination.
Path: /etc/haproxy/haproxy.cfg.
100-redirect_http_to_https

HAProxy configuration for HTTP to HTTPS redirection.
Path: /etc/haproxy/haproxy.cfg.
README.md

Documentation explaining HTTPS, SSL, configurations, and commands used.
Additional Notes
Use Ubuntu 16.04 as the base system for configurations.
Keep SSL certificates updated using Certbot's auto-renewal:
bash
Copy
Edit
sudo certbot renew
Test configurations thoroughly to ensure secure and reliable traffic handling.

Duncan Korir.