# == Class updatemotd::intall
#
class updatemotd::install {
  include updatemotd::params

  $package_name  = $updatemotd::params::package_name
  $package_purge = $updatemotd::params::package_purge

  ensure_packages([$package_name])

  if $package_purge {
    package { $package_purge:
      ensure => purged,
    }

    Package[$package_purge] -> Package[$package_name]
  }
}
