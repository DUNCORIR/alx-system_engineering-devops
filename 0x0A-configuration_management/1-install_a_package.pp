# This Puppet manifest ensures Flask version 2.1.0 is installed using pip3.
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}