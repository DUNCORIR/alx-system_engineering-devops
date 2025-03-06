# This Puppet manifest ensures the 'holberton' user exists, is part of the 'www-data' group,
# and has the appropriate permissions to access specified files and directories.

# Ensure the 'holberton' user exists
user { 'holberton':
  ensure     => present,
  comment    => 'Holberton User',
  home       => '/home/holberton',
  managehome => true,
  shell      => '/bin/bash',
  groups     => ['www-data'],
}

# Ensure the home directory has the correct ownership and permissions
file { '/home/holberton':
  ensure => directory,
  owner  => 'holberton',
  group  => 'holberton',
  mode   => '0750',
}

# Example: Ensure 'holberton' has access to a specific directory
file { '/var/www/html':
  ensure => directory,
  owner  => 'holberton',
  group  => 'www-data',
  mode   => '2755',
}
