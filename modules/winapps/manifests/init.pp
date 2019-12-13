#Default Windows Apps
class winapps {

  $packages = lookup(winapps::packages)
  $provider = lookup(winapps::provider)

  include lookup(winapps::windows::provider)

  package { $packages:
    ensure   => installed,
    provider => $provider,
  }

  #reboot {'after':
  #  subscribe => Package['7zip.install'],
  #}
}
