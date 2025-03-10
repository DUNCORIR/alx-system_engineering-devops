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

# Download and extract WordPress
exec { 'download-wordpress':
  command => '/usr/bin/wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz',
  creates => '/tmp/wordpress.tar.gz',
}

exec { 'extract-wordpress':
  command => '/bin/tar -xzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1',
  creates => '/var/www/html/index.php',
  require => Exec['download-wordpress'],
}

# Ensure WordPress directory has correct permissions
file { '/var/www/html':
  ensure  => directory,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0755',
  recurse => true,  # Recursively apply ownership and permissions
  require => Exec['extract-wordpress'],
}

# Configure wp-config.php
file { '/var/www/html/wp-config.php':
  ensure  => file,
  content => "<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'wordpress');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
?>",
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
  require => Exec['extract-wordpress'],
}

# Ensure Apache serves the WordPress site
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => file,
  content => "<VirtualHost *:80>
    DocumentRoot /var/www/html
    <Directory /var/www/html>
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/apache2/error.log
    CustomLog /var/log/apache2/access.log combined
</VirtualHost>",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['apache2'],
  require => Package['apache2'],
}
