# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
class windows {

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


