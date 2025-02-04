# This Puppet manifest configures Nginx with a custom HTTP response header "X-Served-By".
class nginx_custom_http_header {
  # Ensure Nginx is installed
  package { 'nginx':
    ensure => installed,
  }

  # Ensure Nginx service is enabled and running
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
  }

  # Configure the default site for Nginx
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # Add the custom header to Nginx configuration
  file { '/etc/nginx/conf.d/custom_header.conf':
    ensure  => file,
    content => "add_header X-Served-By $hostname;\n",
    notify  => Service['nginx'],
  }
}

# Apply the nginx_custom_http_header class
include nginx_custom_http_header