#Create required groups on the server
class wingroups {
  group {'Services':
    ensure => present,
  }
}
