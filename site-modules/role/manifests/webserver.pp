#Test webserver
class role::webserver {
  #This role would be made of all the profiles that need to be included to make a webserver work
  #All roles should include the base profile
  include profile::windows_base
  include profile::iis_complete_site
}
