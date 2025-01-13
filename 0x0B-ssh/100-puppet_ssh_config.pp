# This puppet sets up client SSH configuration file so that it connect to a server without typing a password.
file { '/home/duncorir/.ssh/config':
  ensure  => file,
  owner   => 'duncorir',
  group   => 'duncorir',
  mode    => '0600',
  content => template('ssh/config.erb'),
}

file { '/home/duncorir/.ssh':
  ensure => directory,
  owner  => 'duncorir',
  group  => 'duncorir',
  mode   => '0700',
}