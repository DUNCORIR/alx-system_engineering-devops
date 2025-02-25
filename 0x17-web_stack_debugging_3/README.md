# 0x17-Web Stack Debugging #3

## Project Overview
This project focuses on debugging a web stack using **Puppet**. You will identify and fix issues preventing a web server from running properly on an **Ubuntu 14.04 LTS** system.

## Requirements
- All scripts will be run on **Ubuntu 14.04 LTS**.
- Puppet manifests must be error-free and follow **puppet-lint v2.1.1** rules.
- Manifests must have a descriptive comment at the beginning.
- Puppet manifests should end with a `.pp` extension.

## Debugging Steps
1. **Check if the Web Server is Running**  
   ```bash
   sudo service nginx status
   sudo service apache2 status
   ```

2. **Attempt to Start the Web Server**  
   ```bash
   sudo service nginx start
   sudo service apache2 start
   ```

3. **Check Logs for Errors**  
   - Nginx: `/var/log/nginx/error.log`
   - Apache: `/var/log/apache2/error.log`
   ```bash
   tail -f /var/log/nginx/error.log
   ```

4. **Verify Configuration Files**  
   ```bash
   sudo nginx -t
   sudo apachectl configtest
   ```

5. **Check Firewall & Port Conflicts**  
   ```bash
   sudo netstat -tulnp | grep LISTEN
   sudo ufw allow 80/tcp
   sudo ufw allow 443/tcp
   ```

## Puppet Manifest Example
This Puppet manifest ensures that Nginx is installed, enabled, and running:
```puppet
# Ensures Nginx is installed and running
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure => running,
  enable => true,
  require => Package['nginx'],
}
```

## Running the Manifest
Apply the manifest using:
```bash
sudo puppet apply 0-web_debugging.pp
```

## Author
- Duncan Korir