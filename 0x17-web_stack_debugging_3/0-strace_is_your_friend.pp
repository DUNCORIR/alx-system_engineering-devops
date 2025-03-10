# Puppet manifest to fix Apache 500 error and ensure no port conflicts

# Ensure conflicting services (e.g., Nginx) are stopped
service { 'nginx':
  ensure => stopped,
  enable => false,
}

# Ensure Apache package is installed
package { 'apache2':
  ensure => installed,
}

# Ensure Apache service is running
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
}

# Ensure default index.html exists
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello, Apache is working!\n",
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => Service['apache2'],
}
