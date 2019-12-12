#Windows base configuration profile
class profile::windows_base {

  include winapps

  # Code to enable/disable the IE Enhanced Security Configuration
  registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
    ensure => present,
    type   => dword,
    data   => 0,
  }

  # Entry to disable or enable the Shutdown Reason Box in Windows
  registry_value {'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
    ensure => present,
    type   => dword,
    data   => 0,
  }
  # Entry to disable or enable the Shutdown Reason Box in Windows
  registry_value {'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI':
    ensure => present,
    type   => dword,
    data   => 1,
  }

  #Ensure Services group is createdß
  group { "${services_group}":
    ensure => present,
  }
}
