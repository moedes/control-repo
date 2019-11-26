user { 'service_user':
  ensure   => 'present',
  password => 'password01',
  groups   => 'Services',
}
