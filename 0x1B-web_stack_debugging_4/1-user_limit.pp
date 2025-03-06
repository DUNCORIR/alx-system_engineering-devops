# This Puppet manifest ensures the 'holberton' user exists, is part of the 'www-data' group,
# and has the appropriate permissions to access specified files and directories.

# Ensure the holberton user exists
user { 'holberton':
  ensure     => present,
  managehome => true,
  home       => '/home/holberton',
  shell      => '/bin/bash',
}

# Ensure the holberton group exists
group { 'holberton':
  ensure => present,
}

# Ensure /var/www/html is owned by holberton
file { '/var/www/html':
  ensure  => directory,
  owner   => 'holberton',
  group   => 'holberton',
  mode    => '2755',
  recurse => true,
  force   => true,
}
