# Puppet manifest to fix Apache 500 error and set up WordPress

# Ensure Apache and PHP are installed
package { ['apache2', 'php', 'php-mysql', 'libapache2-mod-php']:
  ensure => installed,
}

# Ensure Apache service is running
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
}

# Ensure MySQL is installed and running
package { 'mysql-server':
  ensure => installed,
}

service { 'mysql':
  ensure  => running,
  enable  => true,
  require => Package['mysql-server'],
}

# Download and set up WordPress
exec { 'download-wordpress':
  command => '/usr/bin/wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz',
  creates => '/tmp/wordpress.tar.gz',
}

exec { 'extract-wordpress':
  command => '/bin/tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1',
  creates => '/var/www/html/index.php',
  require => [Exec['download-wordpress'], File['/var/www/html']],
}

# Ensure WordPress directory has correct permissions
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  require => Package['apache2'],
}

# Configure wp-config.php
file { '/var/www/html/wp-config.php':
  ensure  => file,
  content => template('/home/duncorir/alx-system_engineering-devops/0x17-web_stack_debugging_3/templates/wordpress/wp-config.php.erb'),
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => Exec['extract-wordpress'],
}

# Ensure Apache serves the WordPress site
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  content => template('/home/duncorir/alx-system_engineering-devops/0x17-web_stack_debugging_3/templates/apache/000-default.conf.erb'),
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['apache2'],
  require => Package['apache2'],
}
