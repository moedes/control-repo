#Ensure local group services

class groups {
  group {'Services':
    ensure => 'present',
  }
}
