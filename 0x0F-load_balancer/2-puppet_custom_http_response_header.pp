# This Puppet manifest configures Nginx with a custom HTTP response header "X-Served-By".

node default {
  # Ensure Nginx is installed
  package { 'nginx':
    ensure => installed,
  }

  # Ensure the Nginx service is enabled and running
  service { 'nginx':
    ensure     => running,
    enable     => true,
    subscribe  => File['/etc/nginx/conf.d/custom_header.conf'], # Restart on config change
  }

  # Custom Nginx configuration with the header
  file { '/etc/nginx/conf.d/custom_header.conf':
    ensure  => file,
    content => template('nginx/custom_header.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Ensure the Nginx configuration is reloaded after changes
  exec { 'reload-nginx':
    command     => '/usr/sbin/nginx -s reload',
    refreshonly => true,
    subscribe   => File['/etc/nginx/conf.d/custom_header.conf'],
  }
}
