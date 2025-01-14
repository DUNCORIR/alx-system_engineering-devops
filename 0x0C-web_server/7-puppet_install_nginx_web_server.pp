# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Ensure Nginx service is running and enabled
service { 'nginx':
  ensure => running,
  enable => true,
}

# Create a custom HTML page with "Hello World!" for the root (index) page
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!",
}

# Configure Nginx to listen on port 80 (default server configuration)
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],  # Notify Nginx to reload when configuration changes
}

# Create the redirect rule for /redirect_me to a new location with a 301 redirect
file { '/etc/nginx/sites-available/redirect':
  ensure  => file,
  content => "server {
    listen 80;
    server_name _;

    location /redirect_me {
        return 301 http://www.new-location.com;
    }
  }",
  notify  => Service['nginx'],
}

# Enable the site with the redirect configuration
file { '/etc/nginx/sites-enabled/redirect':
  ensure  => link,
  target  => '/etc/nginx/sites-available/redirect',
  notify  => Service['nginx'],
}

# Apply any changes to the Nginx configuration
exec { 'reload_nginx':
  command     => '/usr/sbin/nginx -s reload',
  refreshonly => true,
  require     => File['/etc/nginx/sites-available/redirect'],
}