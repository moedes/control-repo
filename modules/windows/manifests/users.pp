#Create required users on the server
class users {
  user { 'service_user':
    ensure   => present,
    password => 'password01',
    groups   => 'Services',
  }
  group {'Services':
    ensure => present,
  }
}
