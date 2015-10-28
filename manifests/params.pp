# == Class siege::params
#
# Defines parameters for the siege module
# This class is inherited by init.pp
#
# Parameters:
#  $url      - http URL to download the Siege tarball from
#  $ensure   - variable to allow for the package action to be changed
#  $packages - OS specific packages needed to build Siege from source
#

class siege::params {
  $url    = 'http://download.joedog.org/siege/siege-3.1.2.tar.gz'
  $ensure = 'latest'

  case $osfamily {
    'RedHat': {
      $packages = [
        'make',
        'gcc',
        'openssl',
        'openssl-devel'
      ]
    }
    'Debian': {
      $packages = [
        'make',
        'gcc',
        'libssl-dev'
      ]
    }
    default: {
      fail("Unsupported platform: ${osfamily}/${operatingsystem}")
    }
  }
}
