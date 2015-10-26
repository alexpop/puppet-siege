# == Class siege::install::package
#
# Inherits the siege class from init.pp and installs Siege from package repos
#

class siege::install::package (
  $ensure = $siege::params::ensure
) inherits siege {
  # EPEL repo needed for RedHat family OSes
  if $osfamily == 'RedHat' {
    # Using the `stahnma/epel` forge module
    require epel
  }

  package { 'siege':
    ensure => $ensure
  }

  # TO-DO: erb parameters from param hash
  file { '/etc/siege/siegerc2':
    ensure  => file,
    content => template('siege/siegerc.erb'),
  }

  # hiera testing
  $test = hiera('test')
  $value = $test['key1']
  warning("***HIERA $value")
}
