#Default Windows Apps
class winapps {

  $packages = lookup(windows::packages)
  $provider = lookup(windows::provider)

  include lookup(windows::provider)

  package { $packages:
    ensure   => absent,
    provider => $provider,
  }

  reboot {'after':
    subscribe => Package['7zip.install'],
  }
}
