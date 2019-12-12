#Default Windows Apps
class winapps {

  $packages = lookup(winapps::windows::packages)
  $provider = lookup(winapps::windows::provider)

  include lookup(winapps::windows::provider)

  package { $packages:
    ensure   => installed,
    provider => $provider,
  }

  #reboot {'after':
  #  subscribe => Package['7zip.install'],
  #}
}
