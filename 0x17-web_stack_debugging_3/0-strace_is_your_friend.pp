# Puppet manifest to fix Apache 500 error

file { '/var/www/html/index.html':
  ensure  => file,
  content => '<h1>Apache is working!</h1>',
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0644',
}

exec { 'fix-permissions':
  command => 'chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html',
  path    => ['/bin', '/usr/bin'],
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [File['/var/www/html/index.html'], Exec['fix-permissions']],
}