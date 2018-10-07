Write-Host -ForegroundColor cyan Starting Initial Configuration of $env:COMPUTERNAME ...
Write-Host -ForegroundColor cyan Setting up built-in Administrator account ...
net user Administrator /active:yes >$null
Write-Host -ForegroundColor cyan Setting up built-in Administrator account ...
net user administrator R0sebr1dge! >$null
Write-Host -ForegroundColor cyan Resetting winHTTP proxy ...
netsh winhttp reset proxy
Write-Host -ForegroundColor cyan Configuring DiskPart San Policy ...
$sanpolicy = "san policy=onlineall"
$sanpolicy | diskpart
Write-Host -ForegroundColor cyan Configuring Power settings for High performance ...
powercfg /setactive SCHEME_MIN

Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name bfe -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name dhcp -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name dnscache -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name IKEEXT -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name iphlpsvc -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name netlogon -StartupType Manual
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name netman -StartupType Manual
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name nsi -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name termService -StartupType Manual
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name MpsSvc -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Services ...
Set-Service -Name RemoteRegistry -StartupType Automatic
Write-Host -ForegroundColor cyan Configuring Remote Desktop Services ...
Write-Host -ForegroundColor cyan Enabling Keep Alive ...
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -name "KeepAliveEnable" 1 -Type DWord
Write-Host -ForegroundColor cyan Configuring RDS Keep Alive ...
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -name "KeepAliveInterval" 1 -Type DWord
Write-Host -ForegroundColor cyan Configuring RDS Keep Alive ...
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' -name "KeepAliveTimeout" 1 -Type DWord
Write-Host -ForegroundColor cyan Configuring Remote Desktop Services Automatic Reconnect...
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services' -name "fDisableAutoReconnect" 0 -Type DWord
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' -name "fInheritReconnectSame" 1 -Type DWord
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' -name "fReconnectSame" 0 -Type DWord
Write-Host -ForegroundColor cyan Configuring Remote Desktop Services Concurrent Connections ...
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\Winstations\RDP-Tcp' -name "MaxInstanceCount" 4294967295 -Type DWord
Write-Host -ForegroundColor cyan Configuring Firewall ...
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\DomainProfile' -name "EnableFirewall" -Value 1 -Type DWord
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\PublicProfile' -name "EnableFirewall" -Value 1 -Type DWord
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\Standardprofile' -name "EnableFirewall" -Value 1 -Type DWord
Enable-PSRemoting -force
netsh advfirewall firewall set rule dir=in name="Windows Remote Management (HTTP-In)" new enable=yes
netsh advfirewall firewall set rule dir=in name="Windows Remote Management (HTTP-In)" new enable=yes
netsh advfirewall firewall set rule group="Remote Desktop" new enable=yes
netsh advfirewall firewall set rule dir=in name="File and Printer Sharing (Echo Request - ICMPv4-In)" new enable=yes
Write-Host -ForegroundColor cyan Configuration of $env:COMPUTERNAME Completed.
