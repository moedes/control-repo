# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include windows
class windows {
  user { 'service_user':
    ensure   => present,
    password => 'password01',
    groups   => 'Services',
  }

  group {'Services':
    ensure => present,
  }

  file { 'c:\users\services':
    ensure => 'directory',
    owner  => 'service_user',
    group  => 'Services',
  }

  acl {'c:\users\services':
    permissions => [
      {identity => 'service_user', rights => ['full']},
      {identity => 'Services', rights => ['read', 'execute']},
    ],
  }
}
