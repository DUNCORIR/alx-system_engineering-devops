# Ensure the system's package list is updated before installing Nginx
exec { 'apt-update':
  command => '/usr/bin/apt update -y',  # Command to refresh package lists
  path    => ['/usr/bin', '/usr/sbin'], # Ensures the command is found in these paths
  unless  => '/usr/bin/test -f /var/lib/apt/periodic/update-success-stamp', 
  # Only run the command if the update success file does not exist
  before  => Package['nginx'],          # Run this command before installing Nginx
}

# Ensure the Nginx package is installed
package { 'nginx':
  ensure => installed, # Installs Nginx if not already installed
}

# Create or update the custom Nginx configuration file
file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => file,      # Ensures the file exists
  content => @("EOF")   # The contents of the Nginx configuration
server {
    listen 80 default_server;       # Listen on port 80 (default HTTP port)
    listen [::]:80 default_server;  # Listen for IPv6 connections on port 80

    root /var/www/html;             # Set the root directory for the web server
    index index.html;               # Use index.html as the default file

    server_name _;                  # Catch-all server name

    location / {                    # Default location block
        add_header X-Served-By \$hostname; 
        # Add a custom HTTP header with the value as the server hostname
    }
}
| EOF
  notify  => Service['nginx'],      # Notify the Nginx service to restart if this file changes
}

# Manage the Nginx service
service { 'nginx':
  ensure     => running,            # Make sure the service is running
  enable     => true,               # Ensure the service starts on boot
  subscribe  => File['/etc/nginx/conf.d/custom_header.conf'], 
  # Restart the service if the configuration file changes
}
