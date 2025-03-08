# This Puppet manifest ensures the 'holberton' user exists, is part of the 'www-data' group,
# and has the appropriate permissions to access specified files and directories.

# Ensure the holberton user exists and is part of the www-data group
user { 'holberton':
  ensure     => present,
  managehome => true,
  home       => '/home/holberton',
  shell      => '/bin/bash',
  groups     => ['www-data'],  # Add holberton to the www-data group
}

# Ensure the holberton group exists (optional, if needed)
group { 'holberton':
  ensure => present,
}

# Ensure /var/www/html is owned by holberton and has the setgid bit
file { '/var/www/html':
  ensure  => directory,
  owner   => 'holberton',
  group   => 'holberton',
  mode    => '2755',  # setgid bit ensures group inheritance
  recurse => true,    # apply changes recursively
  force   => true,    # force changes if necessary
}
