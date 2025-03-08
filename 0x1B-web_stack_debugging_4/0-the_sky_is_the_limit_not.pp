# This Puppet manifest configures Nginx for debugging and optimizes performance under high traffic

# Ensure the Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Ensure the Nginx service is enabled and running
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/nginx.conf'],
}

# Main Nginx configuration file
file { '/etc/nginx/nginx.conf':
  ensure  => file,
  content => @(EOF),
    user  www-data;
    worker_processes auto;
    error_log  /var/log/nginx/error.log debug;
    pid        /var/run/nginx.pid;

    events {
        worker_connections 1024;
    }

    http {
        include       /etc/nginx/mime.types;
        default_type  application/octet-stream;

        log_format  main  '\$remote_addr - \$remote_user [\$time_local] "\$request" '
                          '\$status \$body_bytes_sent "\$http_referer" '
                          '"\$http_user_agent" "\$http_x_forwarded_for"';

        access_log  /var/log/nginx/access.log  main;

        sendfile        on;
        keepalive_timeout  65;

        gzip  on;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        include /etc/nginx/conf.d/*.conf;

	# Server block
        server {
            listen 80;
            server_name localhost;

            location / {
                root /var/www/html;
                index index.html index.htm;
            }
        }
    }
    |-EOF
  notify  => Service['nginx'],
}
# Ensure the Nginx log directory exists
file { '/var/log/nginx':
  ensure => directory,
  owner  => 'www-data',  # Use www-data instead of nginx
  group  => 'www-data',  # Use www-data instead of nginx
  mode   => '0755',
}
