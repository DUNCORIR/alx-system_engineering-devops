# Puppet manifest to install Flask (v2.1.0) and Werkzeug (v2.1.0)

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  unless  => '/usr/bin/pip3 show flask | grep "Version: 2.1.0"',
}

exec { 'install werkzeug':
  command => '/usr/bin/pip3 install werkzeug==2.1.0',
  unless  => '/usr/bin/pip3 show werkzeug | grep "Version: 2.1.0"',
  require => Exec['install flask'], # Ensures Flask is installed first
}