
#Base windows configuration
class profile::windows_base {
    include service_user
    include groups
}
