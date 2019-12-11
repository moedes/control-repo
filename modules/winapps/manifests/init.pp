#Default Windows Apps
class winapps {
  include chocolatey

  package {'7zip.install':
    ensure   => installed,
    provider => 'chocolatey',
  }

  reboot {'after':
    subscribe => Package['7zip.install'],
  }

  $mymessage = lookup(message)
  notify { "${mymessage}":
  }
}
