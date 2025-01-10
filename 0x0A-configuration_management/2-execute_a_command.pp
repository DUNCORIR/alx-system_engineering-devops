exec { 'kill killmenow process':
  command => '/bin/bash -c "/usr/bin/pkill killmenow"',
  unless  => '/usr/bin/pgrep killmenow',  # Only runs if the process exists
  logoutput => true,
  path => ['/usr/bin', '/usr/sbin', '/bin'],
  user  => 'root',
}