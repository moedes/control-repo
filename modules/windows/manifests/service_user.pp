#Create new user named service_user

class service_user {
  user { 'service_user':
  ensure   => 'present',
  password => 'password01',
  groups   => 'Services',
  }
}
