#Default Windows Apps
class winapps {

  $packages = lookup(winapps::packages)
  $provider = lookup(winapps::provider)

  include lookup(winapps::provider)

  package { $packages:
    ensure   => installed,
    provider => $provider,
  }

  #reboot {'after':
  #  subscribe => Package['7zip.install'],
  #}
}
