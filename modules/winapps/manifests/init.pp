#Default Windows Apps
class winapps {

  $packages = lookup(winapps::packages)
  $provider = lookup(winapps::provider)

  include $provider

  package { $packages:
    ensure   => present,
    provider => $provider,
  }

  #reboot {'after':
  #  subscribe => Package['7zip.install'],
  #}
}
