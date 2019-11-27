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

  registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  registry_value {'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\ShutdownReasonOn':
    ensure => present,
    type   => dword,
    data   => 0,
  }
}
