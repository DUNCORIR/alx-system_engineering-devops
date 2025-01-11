# This Puppet manifest creates a file at /tmp/school with specific permissions and content.

file { '/tmp/school':
  ensure  => 'file',
  mode    => '0744',  # File permission
  owner   => 'www-data',  # File owner
  group   => 'www-data',  # File group
  content => 'I love Puppet',  # File content
}