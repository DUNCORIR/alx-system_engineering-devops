# Ensure Apache, PHP, and required modules are installed
package { ['apache2', 'php', 'php-mysql', 'libapache2-mod-php', 'mysql-server', 'wget', 'tar']:
  ensure => installed,
}

# Ensure Apache service is running
service { 'apache2':
  ensure  => running,
  enable  => true,
  require => Package['apache2'],
}

# Ensure MySQL service is running
service { 'mysql':
  ensure  => running,
  enable  => true,
  require => Package['mysql-server'],
}

# Download WordPress
exec { 'download-wordpress':
  command => '/usr/bin/wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz',
  creates => '/tmp/wordpress.tar.gz',
  user    => 'root',
}

# Extract WordPress
exec { 'extract-wordpress':
  command => '/bin/tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1',
  creates => '/var/www/html/index.php',
  require => Exec['download-wordpress'],
  user    => 'root',
}

# Set correct ownership and permissions
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,
  require => Exec['extract-wordpress'],
}

# Configure wp-config.php using a template
file { '/var/www/html/wp-config.php':
  ensure  => file,
  content => template('/home/duncorir/alx-system_engineering-devops/0x17-web_stack_debugging_3/templates/wp-config.php.erb'),
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => File['/var/www/html'],
}

# Fix Apache configuration if needed
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  content => template('/home/duncorir/alx-system_engineering-devops/0x17-web_stack_debugging_3/templates/apache-default.conf.erb'),
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['apache2'],
}

# Restart Apache to apply changes
exec { 'restart-apache':
  command     => '/usr/bin/systemctl restart apache2',
  refreshonly => true,
}
