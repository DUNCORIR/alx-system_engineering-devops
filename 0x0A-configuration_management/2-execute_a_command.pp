# This Puppet manifest kills the process named 'killmenow' using the pkill command.
exec { 'terminate_killmenow':
  command => 'pkill killmenow',
  path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
  unless  => 'pgrep killmenow',
}