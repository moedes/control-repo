# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include windows
class windows {
  $defaultwebsitepath = 'C:\inetpub\wwwroot'
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
    data   => 0,
  }

  # Add IIS to Windows Server using puppetlabs/dsc module
  dsc_windowsfeature {'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
  }

  # Reboot when pending dsc reboot
  reboot {'dsc_reboot':
    message => 'DSC has requested a reboot',
    when    => 'pending',
    onlyif  => 'pending_dsc_reboot',
  }

  #Add an example website to IIS
  file { 'c:\\inetpub\\complete':
    ensure => 'directory'
  }

  file { 'c:\\inetpub\\complete_vdir':
    ensure => 'directory'
  }

  # Set Permissions

  acl { 'c:\\inetpub\\complete':
    permissions => [
      {'identity' => 'Services', 'rights' => ['read', 'execute']},
    ],
  }

  acl { 'c:\\inetpub\\complete_vdir':
    permissions => [
      {'identity' => 'service_user', 'rights' => ['read', 'execute']},
    ],
  }

  # Configure IIS

  iis_application_pool { 'complete_site_app_pool':
    ensure                  => 'present',
    state                   => 'started',
    managed_pipeline_mode   => 'Integrated',
    managed_runtime_version => 'v4.0',
  }

  #Application Pool No Managed Code .Net CLR Version set up
  iis_application_pool {'test_app_pool':
      ensure                    => 'present',
      enable32_bit_app_on_win64 => true,
      managed_runtime_version   => '',
      managed_pipeline_mode     => 'Classic',
      start_mode                => 'AlwaysRunning'
    }

  iis_site { 'complete':
    ensure           => 'started',
    physicalpath     => 'c:\\inetpub\\complete',
    applicationpool  => 'complete_site_app_pool',
    enabledprotocols => 'https',
    bindings         => [
      {
        'bindinginformation' => '*:8080:',
        'protocol'           => 'http',
      },
    ],
    require          => File['c:\\inetpub\\complete'],
  }

  iis_virtual_directory { 'vdir':
    ensure       => 'present',
    sitename     => 'complete',
    physicalpath => 'c:\\inetpub\\complete_vdir',
    require      => File['c:\\inetpub\\complete_vdir'],
  }
  include chocolatey

  package { '7zip':
    ensure   => absent,
    provider => 'chocolatey',
  }
}


