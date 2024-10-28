# Disable IPv6 on all network adapters
$adapters = Get-NetAdapter
foreach ($adapter in $adapters) {
    Set-NetAdapterBinding -Name $adapter.Name -ComponentID ms_tcpip6 -Enabled $false
}

# Disable RDP connections
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1 -Type DWORD -Force
# Restart the Remote Desktop Services service
# Restart-Service -Name "termservice"
###############################################################################################
# Enable DNS Server feature
Install-WindowsFeature -Name DNS, RSAT-DNS-Server
# Install-WindowsFeature -Name RSAT-DNS-Server, RSAT-DNS-Server-Tools, RSAT-DNS-Server-Mgmt

# Start DNS Server service
Start-Service -Name DNS

# Set DNS Server service to start automatically
Set-Service -Name DNS -StartupType Automatic
###############################################################################################

# Restart the computer to apply the changes
Restart-Computer -Force