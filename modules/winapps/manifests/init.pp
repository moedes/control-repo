#Default Windows Apps
class winapps {
  include lookup(windows::provider)

  package { lookup(windows::packages):
    ensure   => absent,
    provider => lookup(windows::provider),
  }

  reboot {'after':
    subscribe => Package['7zip.install'],
  }
}
