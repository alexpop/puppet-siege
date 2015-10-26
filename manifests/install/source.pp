# == Class siege::install::source
#
# Inherits the siege class from init.pp and installs Siege from source
#

class siege::install::source (
  $packages = $siege::params::packages,
  $ensure   = $siege::params::ensure,
  $url      = $siege::params::url
) inherits siege {
  # Using the `maestrodev/wget` forge module
  require wget

  package {$packages:
    ensure => $ensure
  }

  wget::fetch { 'download_siege':
    source      => $url,
    destination => '/root/siege.tar.gz',
    timeout     => 0,
    verbose     => false,
    notify      => Exec['unpack_and_install']
  }

  # Execute only when notified by `wget::fetch`
  exec { 'unpack_and_install':
    cwd         => '/root',
    #refreshonly => true,
    path        => '/usr/bin:/usr/sbin:/bin',
    command     => 'mkdir -p /usr/local/src/siege;\
      tar -xzf siege.tar.gz -C /usr/local/src/siege --strip-components=1;\
      cd /usr/local/src/siege;\
      ./configure --with-ssl=/usr/bin/openssl;\
      make;\
      make install'
  }
}
