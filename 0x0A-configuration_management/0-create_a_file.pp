file { '/tmp/school':
  ensure  => 'file',
  mode    => '0744',  # File permission
  owner   => 'www-data',  # File owner
  group   => 'www-data',  # File group
  content => 'I love Puppet',  # File content
}