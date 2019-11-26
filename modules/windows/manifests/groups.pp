#Create required groups on the server
class groups {
  group {'Services':
    ensure => present,
  }
}
