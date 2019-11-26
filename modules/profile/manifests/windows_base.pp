
#Base windows configuration
class profile::windows_base {
    include windows::service_user
    include windows::groups
}
