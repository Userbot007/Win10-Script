##########
# Windows 10 Initial Setup Script
# Primary Author: ChrisTitusTech <contact@christitus.com>
# Primary Source: https://github.com/ChrisTitusTech/win10script
# Tweak Author: PratyakshM <hello.pratyakshmehrotra@gmail.com>
# Tweak Source: https://github.com/PratyakshM/Win10-InitialSetupScript
#
#    Note from author: Never run scripts without reading them & understanding what they do.
#
#	Pratyaksh M additions:
#
#	- One command to launch and run
#	- Chocolatey Install
#	- Added Install Programs
#	- Added Debloat UWP Apps
#
##########
# Default preset
$tweaks = @(
	### Require administrator privileges ###
	"RequireAdmin",

	### External Program Setup
	"InstallPrattProgs", #REQUIRED FOR OTHER PROGRAM INSTALLS!
	"Install7Zip",
	"InstallVLC",

	### Windows Apps
	"DebloatAll",

	### Privacy Tweaks ###
	"DisableSmartScreen",         # "EnableSmartScreen",
	"DisableMapUpdates",            # "EnableMapUpdates",
	"SetP2PUpdateLocal",          # "SetP2PUpdateInternet",

	### Security Tweaks ###
	# "EnableSharingMappedDrives",  # "DisableSharingMappedDrives",
	# "DisableAdminShares",           # "EnableAdminShares",
	"DisableSMB1",                # "EnableSMB1",
	# "DisableSMBServer",           # "EnableSMBServer",
	# "DisableLLMNR",               # "EnableLLMNR",
	"SetCurrentNetworkPrivate",     # "SetCurrentNetworkPublic",
	"SetUnknownNetworksPrivate",  # "SetUnknownNetworksPublic",
	"DisableNetDevicesAutoInst",  # "EnableNetDevicesAutoInst",
	"DisableCtrldFolderAccess",	# "EnableCtrldFolderAccess",
	# "DisableFirewall",            # "EnableFirewall",
	"EnableF8BootMenu",             # "DisableF8BootMenu",
	#"SetDEPOptOut",                 # "SetDEPOptIn",
	# "EnableCIMemoryIntegrity",    # "DisableCIMemoryIntegrity",
	#"DisableScriptHost",            # "EnableScriptHost",
	#"EnableDotNetStrongCrypto",     # "DisableDotNetStrongCrypto",
	"DisableMeltdownCompatFlag", # "EnableMeltdownCompatFlag"    

	### Service Tweaks ###
	"DisableHomeGroups",          # "EnableHomeGroups",
	"DisableRemoteAssistance",      # "EnableRemoteAssistance",
	"EnableRemoteDesktop",          # "DisableRemoteDesktop",
	"DisableAutoplay",              # "EnableAutoplay",
	"DisableAutorun",               # "EnableAutorun",
	"DisableDefragmentation",     # "EnableDefragmentation",
	"SetBIOSTimeUTC",             # "SetBIOSTimeLocal",
	"EnableSleepButton",		# "DisableSleepButton",         
	"DisableSleepTimeout",        # "EnableSleepTimeout",
	# "DisableFastStartup",         # "EnableFastStartup",

	### UI Tweaks ###
	# "HideNetworkFromLockScreen",    # "ShowNetworkOnLockScreen",
	# "HideShutdownFromLockScreen",   # "ShowShutdownOnLockScreen",
	"DisableStickyKeys",            # "EnableStickyKeys",
	"ShowTaskManagerDetails"        # "HideTaskManagerDetails",
	"ShowFileOperationsDetails",    # "HideFileOperationsDetails",
	"DisableFileDeleteConfirm",	# "EnableFileDeleteConfirm",    
	#"HideTaskbarSearch",
	"ShowTaskbarSearchIcon",      # "ShowTaskbarSearchBox",
	"HideTaskView",                 # "ShowTaskView",
	# "ShowSmallTaskbarIcons",        # "ShowLargeTaskbarIcons",
	# "SetTaskbarCombineWhenFull",    # "SetTaskbarCombineNever",     # "SetTaskbarCombineAlways",
	# "HideTaskbarPeopleIcon",        # "ShowTaskbarPeopleIcon",
	"ShowTrayIcons",                # "HideTrayIcons",
	"DisableSearchAppInStore",      # "EnableSearchAppInStore",
	"DisableNewAppPrompt",          # "EnableNewAppPrompt",
	# "SetControlPanelSmallIcons",  # "SetControlPanelLargeIcons",  # "SetControlPanelCategories",
	# "SetVisualFXPerformance",     # "SetVisualFXAppearance",
	# "AddENKeyboard",              # "RemoveENKeyboard",
	"EnableNumlock",             	# "DisableNumlock",

	### Explorer UI Tweaks ###
	"ShowKnownExtensions",          # "HideKnownExtensions",
	# "ShowHiddenFiles",              # "HideHiddenFiles",
	"HideSyncNotifications"         # "ShowSyncNotifications",
	# "HideRecentShortcuts",          # "ShowRecentShortcuts",
	"SetExplorerThisPC",            # "SetExplorerQuickAccess",
	"HideThisPCFromDesktop",	# "ShowThisPCOnDesktop",
	# "ShowUserFolderOnDesktop",    # "HideUserFolderFromDesktop",
	# "HideDesktopFromThisPC",        # "ShowDesktopInThisPC",
	# "HideDesktopFromExplorer",    # "ShowDesktopInExplorer",
	# "HideDocumentsFromThisPC",      # "ShowDocumentsInThisPC",
	# "HideDocumentsFromExplorer",  # "ShowDocumentsInExplorer",
	# "HideDownloadsFromThisPC",      # "ShowDownloadsInThisPC",
	# "HideDownloadsFromExplorer",  # "ShowDownloadsInExplorer",
	# "HidePicturesFromThisPC",       # "ShowPicturesInThisPC",
	# "HidePicturesFromExplorer",   # "ShowPicturesInExplorer",
	"Hide3DObjectsFromThisPC",      # "Show3DObjectsInThisPC",
	"Hide3DObjectsFromExplorer",  # "Show3DObjectsInExplorer",
	# "DisableThumbnails",          # "EnableThumbnails",
	# "DisableThumbsDB",              # "EnableThumbsDB",

	### Application Tweaks ###
	"DisableOneDrive",              # "EnableOneDrive",
	"UninstallMsftBloat",           # "InstallMsftBloat",
	"UninstallThirdPartyBloat",     # "InstallThirdPartyBloat",
	# "UninstallWindowsStore",      # "InstallWindowsStore",
	# "DisableXboxFeatures",          # "EnableXboxFeatures",
	"DisableAdobeFlash",            # "EnableAdobeFlash",
	"UninstallInternetExplorer",  # "InstallInternetExplorer",
	"UninstallWorkFolders",       # "InstallWorkFolders",
	# "InstallHyperV",              # "UninstallHyperV",
	"SetPhotoViewerAssociation",    # "UnsetPhotoViewerAssociation",
	"AddPhotoViewerOpenWith",       # "RemovePhotoViewerOpenWith",
	"InstallPDFPrinter",		# "UninstallPDFPrinter",
	# "UninstallXPSPrinter",          # "InstallXPSPrinter",
	# "RemoveFaxPrinter",             # "AddFaxPrinter",

	### Unpinning ###
	"UnpinStartMenuTiles",
	#"UnpinTaskbarIcons",

	### Auxiliary Functions ###
	"WaitForKey"
	"Restart"
)

#########
# Recommended Pratt Programs
#########

Function InstallPrattProgs {
	Write-Output "Installing Chocolatey"
	Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco install chocolatey-core.extension -y
}


Function Install7Zip {
	Write-Output "Installing 7-Zip"
	choco install 7zip -y
}


Function InstallVLC {
	Write-Output "Installing VLC Media Player"
	choco install vlc -y
}

##########
# Privacy Tweaks
##########

# Disable SmartScreen Filter
Function DisableSmartScreen {
	Write-Output "Disabling SmartScreen Filter..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Type DWord -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" -Name "EnabledV9" -Type DWord -Value 0
}

# Enable SmartScreen Filter
Function EnableSmartScreen {
	Write-Output "Enabling SmartScreen Filter..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" -Name "EnabledV9" -ErrorAction SilentlyContinue
}

# Disable automatic Maps updates
Function DisableMapUpdates {
	Write-Output "Disabling automatic Maps updates..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0
}

# Enable automatic Maps updates
Function EnableMapUpdates {
	Write-Output "Enable automatic Maps updates..."
	Remove-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -ErrorAction SilentlyContinue
}

# Restrict Windows Update P2P only to local network - Needed only for 1507 as local P2P is the default since 1511
Function SetP2PUpdateLocal {
	Write-Output "Restricting Windows Update P2P only to local network..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -Type DWord -Value 1
}

# Unrestrict Windows Update P2P
Function SetP2PUpdateInternet {
	Write-Output "Unrestricting Windows Update P2P to internet..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name "DODownloadMode" -ErrorAction SilentlyContinue
}

##########
# Security Tweaks
##########

# Lower UAC level (disabling it completely would break apps)
Function SetUACLow {
	Write-Output "Lowering UAC level..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 0
}

# Raise UAC level
Function SetUACHigh {
	Write-Output "Raising UAC level..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 5
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 1
}

# Enable sharing mapped drives between users
Function EnableSharingMappedDrives {
	Write-Output "Enabling sharing mapped drives between users..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLinkedConnections" -Type DWord -Value 1
}

# Disable sharing mapped drives between users
Function DisableSharingMappedDrives {
	Write-Output "Disabling sharing mapped drives between users..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLinkedConnections" -ErrorAction SilentlyContinue
}

# Disable implicit administrative shares
Function DisableAdminShares {
	Write-Output "Disabling implicit administrative shares..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareWks" -Type DWord -Value 0
}

# Enable implicit administrative shares
Function EnableAdminShares {
	Write-Output "Enabling implicit administrative shares..."
	Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "AutoShareWks" -ErrorAction SilentlyContinue
}

# Disable obsolete SMB 1.0 protocol - Disabled by default since 1709
Function DisableSMB1 {
	Write-Output "Disabling SMB 1.0 protocol..."
	Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
}

# Enable obsolete SMB 1.0 protocol - Disabled by default since 1709
Function EnableSMB1 {
	Write-Output "Enabling SMB 1.0 protocol..."
	Set-SmbServerConfiguration -EnableSMB1Protocol $true -Force
}

# Disable SMB Server - Completely disables file and printer sharing, but leaves the system able to connect to another SMB server as a client
Function DisableSMBServer {
	Write-Output "Disabling SMB Server..."
	Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
	Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force
}

# Enable SMB Server
Function EnableSMBServer {
	Write-Output "Enabling SMB Server..."
	Set-SmbServerConfiguration -EnableSMB2Protocol $true -Force
}

# Disable Link-Local Multicast Name Resolution (LLMNR) protocol
Function DisableLLMNR {
	Write-Output "Disabling LLMNR..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name "EnableMulticast" -Type DWord -Value 0
}

# Enable Link-Local Multicast Name Resolution (LLMNR) protocol
Function EnableLLMNR {
	Write-Output "Enabling LLMNR..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name "EnableMulticast" -ErrorAction SilentlyContinue
}

# Set current network profile to private (allow file sharing, device discovery, etc.)
Function SetCurrentNetworkPrivate {
	Write-Output "Setting current network profile to private..."
	Set-NetConnectionProfile -NetworkCategory Private
}

# Set current network profile to public (deny file sharing, device discovery, etc.)
Function SetCurrentNetworkPublic {
	Write-Output "Setting current network profile to public..."
	Set-NetConnectionProfile -NetworkCategory Public
}

# Set unknown networks profile to private (allow file sharing, device discovery, etc.)
Function SetUnknownNetworksPrivate {
	Write-Output "Setting unknown networks profile to private..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24" -Name "Category" -Type DWord -Value 1
}

# Set unknown networks profile to public (deny file sharing, device discovery, etc.)
Function SetUnknownNetworksPublic {
	Write-Output "Setting unknown networks profile to public..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\010103000F0000F0010000000F0000F0C967A3643C3AD745950DA7859209176EF5B87C875FA20DF21951640E807D7C24" -Name "Category" -ErrorAction SilentlyContinue
}

# Disable automatic installation of network devices
Function DisableNetDevicesAutoInst {
	Write-Output "Disabling automatic installation of network devices..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Name "AutoSetup" -Type DWord -Value 0
}

# Enable automatic installation of network devices
Function EnableNetDevicesAutoInst {
	Write-Output "Enabling automatic installation of network devices..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" -Name "AutoSetup" -ErrorAction SilentlyContinue
}

# Enable Controlled Folder Access (Defender Exploit Guard feature) - Applicable to 1709 or newer, requires Windows Defender to be enabled
Function EnableCtrldFolderAccess {
	Write-Output "Enabling Controlled Folder Access..."
	Set-MpPreference -EnableControlledFolderAccess Enabled
}

# Disable Controlled Folder Access (Defender Exploit Guard feature) - Applicable to 1709 or newer, requires Windows Defender to be enabled
Function DisableCtrldFolderAccess {
	Write-Output "Disabling Controlled Folder Access..."
	Set-MpPreference -EnableControlledFolderAccess Disabled
}

# Disable Firewall
Function DisableFirewall {
	Write-Output "Disabling Firewall..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Name "EnableFirewall" -Type DWord -Value 0
}

# Enable Firewall
Function EnableFirewall {
	Write-Output "Enabling Firewall..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Name "EnableFirewall" -ErrorAction SilentlyContinue
}

# Enable F8 boot menu options
Function EnableF8BootMenu {
	Write-Output "Enabling F8 boot menu options..."
	bcdedit /set `{current`} bootmenupolicy Legacy | Out-Null
}

# Disable F8 boot menu options
Function DisableF8BootMenu {
	Write-Output "Disabling F8 boot menu options..."
	bcdedit /set `{current`} bootmenupolicy Standard | Out-Null
}

# Set Data Execution Prevention (DEP) policy to OptOut
Function SetDEPOptOut {
	Write-Output "Setting Data Execution Prevention (DEP) policy to OptOut..."
	bcdedit /set `{current`} nx OptOut | Out-Null
}

# Set Data Execution Prevention (DEP) policy to OptIn
Function SetDEPOptIn {
	Write-Output "Setting Data Execution Prevention (DEP) policy to OptIn..."
	bcdedit /set `{current`} nx OptIn | Out-Null
}

# Enable Core Isolation Memory Integrity - Part of Windows Defender System Guard virtualization-based security - Supported from 1803
Function EnableCIMemoryIntegrity {
	Write-Output "Enabling Core Isolation Memory Integrity..."
	If (!(Test-Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity")) {
		New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Name "Enabled" -Type DWord -Value 1
}

# Disable Core Isolation Memory Integrity - 
Function DisableCIMemoryIntegrity {
	Write-Output "Disabling Core Isolation Memory Integrity..."
	Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" -Name "Enabled" -ErrorAction SilentlyContinue
}

# Disable Windows Script Host (execution of *.vbs scripts and alike)
Function DisableScriptHost {
	Write-Output "Disabling Windows Script Host..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Type DWord -Value 0
}

# Enable Windows Script Host
Function EnableScriptHost {
	Write-Output "Enabling Windows Script Host..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name "Enabled" -ErrorAction SilentlyContinue
}

# Enable strong cryptography for .NET Framework (version 4 and above)
# https://stackoverflow.com/questions/36265534/invoke-webrequest-ssl-fails
Function EnableDotNetStrongCrypto {
	Write-output "Enabling .NET strong cryptography..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" -Name "SchUseStrongCrypto" -Type DWord -Value 1
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319" -Name "SchUseStrongCrypto" -Type DWord -Value 1
}

# Disable strong cryptography for .NET Framework (version 4 and above)
Function DisableDotNetStrongCrypto {
	Write-output "Disabling .NET strong cryptography..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\.NETFramework\v4.0.30319" -Name "SchUseStrongCrypto" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework\v4.0.30319" -Name "SchUseStrongCrypto" -ErrorAction SilentlyContinue
}

# Enable Meltdown (CVE-2017-5754) compatibility flag - Required for January 2018 and all subsequent Windows updates
# This flag is normally automatically enabled by compatible antivirus software (such as Windows Defender).
# Use the tweak only if you have confirmed that your AV is compatible but unable to set the flag automatically or if you don't use any AV at all.
# See https://support.microsoft.com/en-us/help/4072699/january-3-2018-windows-security-updates-and-antivirus-software for details.
Function EnableMeltdownCompatFlag {
	Write-Output "Enabling Meltdown (CVE-2017-5754) compatibility flag..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" -Name "cadca5fe-87d3-4b96-b7fb-a231484277cc" -Type DWord -Value 0
}

# Disable Meltdown (CVE-2017-5754) compatibility flag
Function DisableMeltdownCompatFlag {
	Write-Output "Disabling Meltdown (CVE-2017-5754) compatibility flag..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" -Name "cadca5fe-87d3-4b96-b7fb-a231484277cc" -ErrorAction SilentlyContinue
}



##########
# Service Tweaks
##########

# Stop and disable Home Groups services - Not applicable to 1803 and newer or Server
Function DisableHomeGroups {
	Write-Output "Stopping and disabling Home Groups services..."
	Stop-Service "HomeGroupListener" -WarningAction SilentlyContinue
	Set-Service "HomeGroupListener" -StartupType Disabled
	Stop-Service "HomeGroupProvider" -WarningAction SilentlyContinue
	Set-Service "HomeGroupProvider" -StartupType Disabled
}

# Enable and start Home Groups services - Not applicable to 1803 and newer or Server
Function EnableHomeGroups {
	Write-Output "Starting and enabling Home Groups services..."
	Set-Service "HomeGroupListener" -StartupType Manual
	Set-Service "HomeGroupProvider" -StartupType Manual
	Start-Service "HomeGroupProvider" -WarningAction SilentlyContinue
}

# Disable Remote Assistance - Not applicable to Server (unless Remote Assistance is explicitly installed)
Function DisableRemoteAssistance {
	Write-Output "Disabling Remote Assistance..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 0
}

# Enable Remote Assistance - Not applicable to Server (unless Remote Assistance is explicitly installed)
Function EnableRemoteAssistance {
	Write-Output "Enabling Remote Assistance..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -Name "fAllowToGetHelp" -Type DWord -Value 1
}

# Enable Remote Desktop w/o Network Level Authentication
Function EnableRemoteDesktop {
	Write-Output "Enabling Remote Desktop w/o Network Level Authentication..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" -Type DWord -Value 0
	Enable-NetFirewallRule -Name "RemoteDesktop*"
}

# Disable Remote Desktop
Function DisableRemoteDesktop {
	Write-Output "Disabling Remote Desktop..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Type DWord -Value 1
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "UserAuthentication" -Type DWord -Value 1
	Disable-NetFirewallRule -Name "RemoteDesktop*"
}

# Disable Autoplay
Function DisableAutoplay {
	Write-Output "Disabling Autoplay..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Type DWord -Value 1
}

# Enable Autoplay
Function EnableAutoplay {
	Write-Output "Enabling Autoplay..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Type DWord -Value 0
}

# Disable Autorun for all drives
Function DisableAutorun {
	Write-Output "Disabling Autorun for all drives..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -Type DWord -Value 255
}

# Enable Autorun for removable drives
Function EnableAutorun {
	Write-Output "Enabling Autorun for all drives..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoDriveTypeAutoRun" -ErrorAction SilentlyContinue
}

# Disable scheduled defragmentation task
Function DisableDefragmentation {
	Write-Output "Disabling scheduled defragmentation..."
	Disable-ScheduledTask -TaskName "Microsoft\Windows\Defrag\ScheduledDefrag" | Out-Null
}

# Enable scheduled defragmentation task
Function EnableDefragmentation {
	Write-Output "Enabling scheduled defragmentation..."
	Enable-ScheduledTask -TaskName "Microsoft\Windows\Defrag\ScheduledDefrag" | Out-Null
}

# Set BIOS time to UTC
Function SetBIOSTimeUTC {
	Write-Output "Setting BIOS time to UTC..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -Type DWord -Value 1
}

# Set BIOS time to local time
Function SetBIOSTimeLocal {
	Write-Output "Setting BIOS time to Local time..."
	Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" -Name "RealTimeIsUniversal" -ErrorAction SilentlyContinue
}

# Enable Hibernation - Do not use on Server with automatically started Hyper-V hvboot service as it may lead to BSODs (Win10 with Hyper-V is fine)
Function EnableHibernation {
	Write-Output "Enabling Hibernation..."
	Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 1
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 1
}

# Disable Hibernation
Function DisableHibernation {
	Write-Output "Disabling Hibernation..."
	Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernteEnabled" -Type Dword -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type Dword -Value 0
}

# Disable Sleep start menu and keyboard button
Function DisableSleepButton {
	Write-Output "Disabling Sleep start menu and keyboard button..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowSleepOption" -Type Dword -Value 0
	powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 0
	powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 0
}

# Enable Sleep start menu and keyboard button
Function EnableSleepButton {
	Write-Output "Enabling Sleep start menu and keyboard button..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowSleepOption" -Type Dword -Value 1
	powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1
	powercfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_BUTTONS SBUTTONACTION 1
}

# Disable display and sleep mode timeouts
Function DisableSleepTimeout {
	Write-Output "Disabling display and sleep mode timeouts..."
	powercfg /X monitor-timeout-ac 0
	powercfg /X monitor-timeout-dc 0
	powercfg /X standby-timeout-ac 0
	powercfg /X standby-timeout-dc 0
}

# Enable display and sleep mode timeouts
Function EnableSleepTimeout {
	Write-Output "Enabling display and sleep mode timeouts..."
	powercfg /X monitor-timeout-ac 10
	powercfg /X monitor-timeout-dc 5
	powercfg /X standby-timeout-ac 30
	powercfg /X standby-timeout-dc 15
}

# Disable Fast Startup
Function DisableFastStartup {
	Write-Output "Disabling Fast Startup..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type DWord -Value 0
}

# Enable Fast Startup
Function EnableFastStartup {
	Write-Output "Enabling Fast Startup..."
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Type DWord -Value 1
}



##########
# UI Tweaks
##########

# Hide network options from Lock Screen
Function HideNetworkFromLockScreen {
	Write-Output "Hiding network options from Lock Screen..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -Type DWord -Value 1
}

# Show network options on lock screen
Function ShowNetworkOnLockScreen {
	Write-Output "Showing network options on Lock Screen..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "DontDisplayNetworkSelectionUI" -ErrorAction SilentlyContinue
}

# Hide shutdown options from Lock Screen
Function HideShutdownFromLockScreen {
	Write-Output "Hiding shutdown options from Lock Screen..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ShutdownWithoutLogon" -Type DWord -Value 0
}

# Show shutdown options on lock screen
Function ShowShutdownOnLockScreen {
	Write-Output "Showing shutdown options on Lock Screen..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ShutdownWithoutLogon" -Type DWord -Value 1
}

# Disable Sticky keys prompt
Function DisableStickyKeys {
	Write-Output "Disabling Sticky keys prompt..."
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "506"
}

# Enable Sticky keys prompt
Function EnableStickyKeys {
	Write-Output "Enabling Sticky keys prompt..."
	Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type String -Value "510"
}

# Show Task Manager details - Applicable to 1607 and later - Although this functionality exist even in earlier versions, the Task Manager's behavior is different there and is not compatible with this tweak
Function ShowTaskManagerDetails {
	Write-Output "Showing task manager details..."
	$taskmgr = Start-Process -WindowStyle Hidden -FilePath taskmgr.exe -PassThru
	Do {
		Start-Sleep -Milliseconds 100
		$preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
	} Until ($preferences)
	Stop-Process $taskmgr
	$preferences.Preferences[28] = 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
}

# Hide Task Manager details
Function HideTaskManagerDetails {
	Write-Output "Hiding task manager details..."
	$preferences = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -ErrorAction SilentlyContinue
	If ($preferences) {
		$preferences.Preferences[28] = 1
		Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\TaskManager" -Name "Preferences" -Type Binary -Value $preferences.Preferences
	}
}

# Show file operations details
Function ShowFileOperationsDetails {
	Write-Output "Showing file operations details..."
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -Type DWord -Value 1
}

# Hide file operations details
Function HideFileOperationsDetails {
	Write-Output "Hiding file operations details..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" -Name "EnthusiastMode" -ErrorAction SilentlyContinue
}

# Enable file delete confirmation dialog
Function EnableFileDeleteConfirm {
	Write-Output "Enabling file delete confirmation dialog..."
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "ConfirmFileDelete" -Type DWord -Value 1
}

# Disable file delete confirmation dialog
Function DisableFileDeleteConfirm {
	Write-Output "Disabling file delete confirmation dialog..."
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "ConfirmFileDelete" -ErrorAction SilentlyContinue
}

# Hide Taskbar Search icon / box
Function HideTaskbarSearch {
	Write-Output "Hiding Taskbar Search icon / box..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 0
}

# Show Taskbar Search icon
Function ShowTaskbarSearchIcon {
	Write-Output "Showing Taskbar Search icon..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 1
}

# Show Taskbar Search box
Function ShowTaskbarSearchBox {
	Write-Output "Showing Taskbar Search box..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Type DWord -Value 2
}

# Hide Task View button
Function HideTaskView {
	Write-Output "Hiding Task View button..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Type DWord -Value 0
}

# Show Task View button
Function ShowTaskView {
	Write-Output "Showing Task View button..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -ErrorAction SilentlyContinue
}

# Show small icons in taskbar
Function ShowSmallTaskbarIcons {
	Write-Output "Showing small icons in taskbar..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Type DWord -Value 1
}

# Show large icons in taskbar
Function ShowLargeTaskbarIcons {
	Write-Output "Showing large icons in taskbar..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -ErrorAction SilentlyContinue
}

# Set taskbar buttons to show labels and combine when taskbar is full
Function SetTaskbarCombineWhenFull {
	Write-Output "Setting taskbar buttons to combine when taskbar is full..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -Type DWord -Value 1
}

# Set taskbar buttons to show labels and never combine
Function SetTaskbarCombineNever {
	Write-Output "Setting taskbar buttons to never combine..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -Type DWord -Value 2
}

# Set taskbar buttons to always combine and hide labels
Function SetTaskbarCombineAlways {
	Write-Output "Setting taskbar buttons to always combine, hide labels..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarGlomLevel" -ErrorAction SilentlyContinue
}

# Hide Taskbar People icon
Function HideTaskbarPeopleIcon {
	Write-Output "Hiding People icon..."
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -Type DWord -Value 0
}

# Show Taskbar People icon
Function ShowTaskbarPeopleIcon {
	Write-Output "Showing People icon..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" -Name "PeopleBand" -ErrorAction SilentlyContinue
}

# Show all tray icons
Function ShowTrayIcons {
	Write-Output "Showing all tray icons..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -Type DWord -Value 0
}

# Hide tray icons as needed
Function HideTrayIcons {
	Write-Output "Hiding tray icons..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableAutoTray" -ErrorAction SilentlyContinue
}

# Disable search for app in store for unknown extensions
Function DisableSearchAppInStore {
	Write-Output "Disabling search for app in store for unknown extensions..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoUseStoreOpenWith" -Type DWord -Value 1
}

# Enable search for app in store for unknown extensions
Function EnableSearchAppInStore {
	Write-Output "Enabling search for app in store for unknown extensions..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoUseStoreOpenWith" -ErrorAction SilentlyContinue
}

# Disable 'How do you want to open this file?' prompt
Function DisableNewAppPrompt {
	Write-Output "Disabling 'How do you want to open this file?' prompt..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoNewAppAlert" -Type DWord -Value 1
}

# Enable 'How do you want to open this file?' prompt
Function EnableNewAppPrompt {
	Write-Output "Enabling 'How do you want to open this file?' prompt..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "NoNewAppAlert" -ErrorAction SilentlyContinue
}

# Set Control Panel view to Small icons (Classic)
Function SetControlPanelSmallIcons {
	Write-Output "Setting Control Panel view to small icons..."
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "StartupPage" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "AllItemsIconView" -Type DWord -Value 1
}

# Set Control Panel view to Large icons (Classic)
Function SetControlPanelLargeIcons {
	Write-Output "Setting Control Panel view to large icons..."
	If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel")) {
		New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "StartupPage" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "AllItemsIconView" -Type DWord -Value 0
}

# Set Control Panel view to categories
Function SetControlPanelCategories {
	Write-Output "Setting Control Panel view to categories..."
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "StartupPage" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" -Name "AllItemsIconView" -ErrorAction SilentlyContinue
}

# Adjusts visual effects for performance - Disables animations, transparency etc. but leaves font smoothing and miniatures enabled
Function SetVisualFXPerformance {
	Write-Output "Adjusting visual effects for performance..."
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](144,18,3,128,16,0,0,0))
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0
}

# Adjusts visual effects for appearance
Function SetVisualFXAppearance {
	Write-Output "Adjusting visual effects for appearance..."
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 1
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 400
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](158,30,7,128,18,0,0,0))
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 1
	Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 1
}

# Add secondary en-US keyboard
Function AddENKeyboard {
	Write-Output "Adding secondary en-US keyboard..."
	$langs = Get-WinUserLanguageList
	$langs.Add("en-US")
	Set-WinUserLanguageList $langs -Force
}

# Remove secondary en-US keyboard
Function RemoveENKeyboard {
	Write-Output "Removing secondary en-US keyboard..."
	$langs = Get-WinUserLanguageList
	Set-WinUserLanguageList ($langs | ? {$_.LanguageTag -ne "en-US"}) -Force
}

# Enable NumLock after startup
Function EnableNumlock {
	Write-Output "Enabling NumLock after startup..."
	If (!(Test-Path "HKU:")) {
		New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
	}
	Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483650
	Add-Type -AssemblyName System.Windows.Forms
	If (!([System.Windows.Forms.Control]::IsKeyLocked('NumLock'))) {
		$wsh = New-Object -ComObject WScript.Shell
		$wsh.SendKeys('{NUMLOCK}')
	}
}

# Disable NumLock after startup
Function DisableNumlock {
	Write-Output "Disabling NumLock after startup..."
	If (!(Test-Path "HKU:")) {
		New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS | Out-Null
	}
	Set-ItemProperty -Path "HKU:\.DEFAULT\Control Panel\Keyboard" -Name "InitialKeyboardIndicators" -Type DWord -Value 2147483648
	Add-Type -AssemblyName System.Windows.Forms
	If ([System.Windows.Forms.Control]::IsKeyLocked('NumLock')) {
		$wsh = New-Object -ComObject WScript.Shell
		$wsh.SendKeys('{NUMLOCK}')
	}
}



##########
# Explorer UI Tweaks
##########

# Show known file extensions
Function ShowKnownExtensions {
	Write-Output "Showing known file extensions..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 0
}

# Hide known file extensions
Function HideKnownExtensions {
	Write-Output "Hiding known file extensions..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Type DWord -Value 1
}

# Show hidden files
Function ShowHiddenFiles {
	Write-Output "Showing hidden files..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 1
}

# Hide hidden files
Function HideHiddenFiles {
	Write-Output "Hiding hidden files..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Type DWord -Value 2
}

# Hide sync provider notifications
Function HideSyncNotifications {
	Write-Output "Hiding sync provider notifications..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Type DWord -Value 0
}

# Show sync provider notifications
Function ShowSyncNotifications {
	Write-Output "Showing sync provider notifications..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Type DWord -Value 1
}

# Hide recently and frequently used item shortcuts in Explorer
Function HideRecentShortcuts {
	Write-Output "Hiding recent shortcuts..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Type DWord -Value 0
}

# Show recently and frequently used item shortcuts in Explorer
Function ShowRecentShortcuts {
	Write-Output "Showing recent shortcuts..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -ErrorAction SilentlyContinue
}

# Change default Explorer view to This PC
Function SetExplorerThisPC {
	Write-Output "Changing default Explorer view to This PC..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Type DWord -Value 1
}

# Change default Explorer view to Quick Access
Function SetExplorerQuickAccess {
	Write-Output "Changing default Explorer view to Quick Access..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -ErrorAction SilentlyContinue
}

# Show This PC shortcut on desktop
Function ShowThisPCOnDesktop {
	Write-Output "Showing This PC shortcut on desktop..."
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Type DWord -Value 0
}

# Hide This PC shortcut from desktop
Function HideThisPCFromDesktop {
	Write-Output "Hiding This PC shortcut from desktop..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -ErrorAction SilentlyContinue
}

# Show User Folder shortcut on desktop
Function ShowUserFolderOnDesktop {
	Write-Output "Showing User Folder shortcut on desktop..."
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Type DWord -Value 0
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -Type DWord -Value 0
}

# Hide User Folder shortcut from desktop
Function HideUserFolderFromDesktop {
	Write-Output "Hiding User Folder shortcut from desktop..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" -ErrorAction SilentlyContinue
}

# Hide Desktop icon from This PC - The icon remains in personal folders and open/save dialogs
Function HideDesktopFromThisPC {
	Write-Output "Hiding Desktop icon from This PC..."
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" -Recurse -ErrorAction SilentlyContinue
}

# Show Desktop icon in This PC
Function ShowDesktopInThisPC {
	Write-Output "Showing Desktop icon in This PC..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}" | Out-Null
	}
}

# Hide Desktop icon from Explorer namespace - Hides the icon also from personal folders and open/save dialogs
Function HideDesktopFromExplorer {
	Write-Output "Hiding Desktop icon from Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
}

# Show Desktop icon in Explorer namespace
Function ShowDesktopInExplorer {
	Write-Output "Showing Desktop icon in Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
}

# Hide Documents icon from This PC - The icon remains in personal folders and open/save dialogs
Function HideDocumentsFromThisPC {
	Write-Output "Hiding Documents icon from This PC..."
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" -Recurse -ErrorAction SilentlyContinue
}

# Show Documents icon in This PC
Function ShowDocumentsInThisPC {
	Write-Output "Showing Documents icon in This PC..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af}" | Out-Null
	}
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}" | Out-Null
	}
}

# Hide Documents icon from Explorer namespace - Hides the icon also from personal folders and open/save dialogs
Function HideDocumentsFromExplorer {
	Write-Output "Hiding Documents icon from Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
}

# Show Documents icon in Explorer namespace
Function ShowDocumentsInExplorer {
	Write-Output "Showing Documents icon in Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
}

# Hide Downloads icon from This PC - The icon remains in personal folders and open/save dialogs
Function HideDownloadsFromThisPC {
	Write-Output "Hiding Downloads icon from This PC..."
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" -Recurse -ErrorAction SilentlyContinue
}

# Show Downloads icon in This PC
Function ShowDownloadsInThisPC {
	Write-Output "Showing Downloads icon in This PC..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f}" | Out-Null
	}
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}" | Out-Null
	}
}

# Hide Downloads icon from Explorer namespace - Hides the icon also from personal folders and open/save dialogs
Function HideDownloadsFromExplorer {
	Write-Output "Hiding Downloads icon from Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
}

# Show Downloads icon in Explorer namespace
Function ShowDownloadsInExplorer {
	Write-Output "Showing Downloads icon in Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
}

# Hide Pictures icon from This PC - The icon remains in personal folders and open/save dialogs
Function HidePicturesFromThisPC {
	Write-Output "Hiding Pictures icon from This PC..."
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" -Recurse -ErrorAction SilentlyContinue
}

# Show Pictures icon in This PC
Function ShowPicturesInThisPC {
	Write-Output "Showing Pictures icon in This PC..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" | Out-Null
	}
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" | Out-Null
	}
}

# Hide Pictures icon from Explorer namespace - Hides the icon also from personal folders and open/save dialogs
Function HidePicturesFromExplorer {
	Write-Output "Hiding Pictures icon from Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
}

# Show Pictures icon in Explorer namespace
Function ShowPicturesInExplorer {
	Write-Output "Showing Pictures icon in Explorer namespace..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Show"
}

# Hide 3D Objects icon from This PC - The icon remains in personal folders and open/save dialogs
Function Hide3DObjectsFromThisPC {
	Write-Output "Hiding 3D Objects icon from This PC..."
	Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -Recurse -ErrorAction SilentlyContinue
}

# Show 3D Objects icon in This PC
Function Show3DObjectsInThisPC {
	Write-Output "Showing 3D Objects icon in This PC..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" | Out-Null
	}
}

# Hide 3D Objects icon from Explorer namespace - Hides the icon also from personal folders and open/save dialogs
Function Hide3DObjectsFromExplorer {
	Write-Output "Hiding 3D Objects icon from Explorer namespace..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
	If (!(Test-Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag")) {
		New-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name "ThisPCPolicy" -Type String -Value "Hide"
}

# Show 3D Objects icon in Explorer namespace
Function Show3DObjectsInExplorer {
	Write-Output "Showing 3D Objects icon in Explorer namespace..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name "ThisPCPolicy" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name "ThisPCPolicy" -ErrorAction SilentlyContinue
}

# Disable thumbnails, show only file extension icons
Function DisableThumbnails {
	Write-Output "Disabling thumbnails..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Type DWord -Value 1
}

# Enable thumbnails
Function EnableThumbnails {
	Write-Output "Enabling thumbnails..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Type DWord -Value 0
}

# Disable creation of Thumbs.db thumbnail cache files
Function DisableThumbsDB {
	Write-Output "Disabling creation of Thumbs.db..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbnailCache" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbsDBOnNetworkFolders" -Type DWord -Value 1
}

# Enable creation of Thumbs.db thumbnail cache files
Function EnableThumbsDB {
	Write-Output "Enable creation of Thumbs.db..."
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbnailCache" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbsDBOnNetworkFolders" -ErrorAction SilentlyContinue
}



##########
# Application Tweaks
##########

# Disable OneDrive
Function DisableOneDrive {
	Write-Output "Disabling OneDrive..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Type DWord -Value 1
}

# Enable OneDrive
Function EnableOneDrive {
	Write-Output "Enabling OneDrive..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -ErrorAction SilentlyContinue
}

# Uninstall default Microsoft applications
Function UninstallMsftBloat {
	Write-Output "Uninstalling default Microsoft applications..."
	Get-AppxPackage "Microsoft.549981C3F5F10" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.3DBuilder" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.AppConnector" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.BingFinance" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.BingNews" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.BingSports" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.BingTranslator" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.BingWeather" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.CommsPhone" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.ConnectivityStore" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.GetHelp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Getstarted" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Messaging" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Microsoft3DViewer" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MicrosoftPowerBIForWindows" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MicrosoftStickyNotes" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MinecraftUWP" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.MSPaint" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.NetworkSpeedTest" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Office.OneNote" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Office.Sway" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.OneConnect" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.People" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Print3D" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.RemoteDesktop" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.SkypeApp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Wallet" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsAlarms" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsCamera" | Remove-AppxPackage
	Get-AppxPackage "microsoft.windowscommunicationsapps" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsFeedbackHub" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsMaps" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsPhone" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsSoundRecorder" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.YourPhone" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.ZuneMusic" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.ZuneVideo" | Remove-AppxPackage
}

# Install default Microsoft applications
Function InstallMsftBloat {
	Write-Output "Installing default Microsoft applications..."
	Get-AppxPackage -AllUsers "Microsoft.549981C3F5F10" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.3DBuilder" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.AppConnector" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.BingFinance" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.BingNews" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.BingSports" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.BingTranslator" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.BingWeather" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.CommsPhone" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.ConnectivityStore" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.GetHelp" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Getstarted" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Messaging" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Microsoft3DViewer" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MicrosoftOfficeHub" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MicrosoftPowerBIForWindows" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MicrosoftSolitaireCollection" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MicrosoftStickyNotes" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MinecraftUWP" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.MSPaint" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.NetworkSpeedTest" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Office.OneNote" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Office.Sway" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.OneConnect" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.People" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Print3D" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.RemoteDesktop" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.SkypeApp" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Wallet" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsAlarms" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsCamera" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.windowscommunicationsapps" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsFeedbackHub" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsMaps" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsPhone" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsSoundRecorder" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.XboxApp" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.YourPhone" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.ZuneMusic" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.ZuneVideo" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
}
# In case you have removed them for good, you can try to restore the files using installation medium as follows
# New-Item C:\Mnt -Type Directory | Out-Null
# dism /Mount-Image /ImageFile:D:\sources\install.wim /index:1 /ReadOnly /MountDir:C:\Mnt
# robocopy /S /SEC /R:0 "C:\Mnt\Program Files\WindowsApps" "C:\Program Files\WindowsApps"
# dism /Unmount-Image /Discard /MountDir:C:\Mnt
# Remove-Item -Path C:\Mnt -Recurse

# Uninstall default third party applications
function UninstallThirdPartyBloat {
	Write-Output "Uninstalling default third party applications..."
	Get-AppxPackage "2414FC7A.Viber" | Remove-AppxPackage
	Get-AppxPackage "41038Axilesoft.ACGMediaPlayer" | Remove-AppxPackage
	Get-AppxPackage "46928bounde.EclipseManager" | Remove-AppxPackage
	Get-AppxPackage "4DF9E0F8.Netflix" | Remove-AppxPackage
	Get-AppxPackage "64885BlueEdge.OneCalendar" | Remove-AppxPackage
	Get-AppxPackage "7EE7776C.LinkedInforWindows" | Remove-AppxPackage
	Get-AppxPackage "828B5831.HiddenCityMysteryofShadows" | Remove-AppxPackage
	Get-AppxPackage "89006A2E.AutodeskSketchBook" | Remove-AppxPackage
	Get-AppxPackage "9E2F88E3.Twitter" | Remove-AppxPackage
	Get-AppxPackage "A278AB0D.DisneyMagicKingdoms" | Remove-AppxPackage
	Get-AppxPackage "A278AB0D.MarchofEmpires" | Remove-AppxPackage
	Get-AppxPackage "ActiproSoftwareLLC.562882FEEB491" | Remove-AppxPackage
	Get-AppxPackage "AdobeSystemsIncorporated.AdobePhotoshopExpress" | Remove-AppxPackage
	Get-AppxPackage "CAF9E577.Plex" | Remove-AppxPackage
	Get-AppxPackage "D52A8D61.FarmVille2CountryEscape" | Remove-AppxPackage
	Get-AppxPackage "D5EA27B7.Duolingo-LearnLanguagesforFree" | Remove-AppxPackage
	Get-AppxPackage "DB6EA5DB.CyberLinkMediaSuiteEssentials" | Remove-AppxPackage
	Get-AppxPackage "DolbyLaboratories.DolbyAccess" | Remove-AppxPackage
	Get-AppxPackage "Drawboard.DrawboardPDF" | Remove-AppxPackage
	Get-AppxPackage "Facebook.Facebook" | Remove-AppxPackage
	Get-AppxPackage "flaregamesGmbH.RoyalRevolt2" | Remove-AppxPackage
	Get-AppxPackage "GAMELOFTSA.Asphalt8Airborne" | Remove-AppxPackage
	Get-AppxPackage "KeeperSecurityInc.Keeper" | Remove-AppxPackage
	Get-AppxPackage "king.com.BubbleWitch3Saga" | Remove-AppxPackage
	Get-AppxPackage "king.com.CandyCrushSodaSaga" | Remove-AppxPackage
	Get-AppxPackage "PandoraMediaInc.29680B314EFC2" | Remove-AppxPackage
	Get-AppxPackage "SpotifyAB.SpotifyMusic" | Remove-AppxPackage
	Get-AppxPackage "WinZipComputing.WinZipUniversal" | Remove-AppxPackage
	Get-AppxPackage "XINGAG.XING" | Remove-AppxPackage
}

# Install default third party applications
Function InstallThirdPartyBloat {
	Write-Output "Installing default third party applications..."
	Get-AppxPackage -AllUsers "2414FC7A.Viber" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "41038Axilesoft.ACGMediaPlayer" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "46928bounde.EclipseManager" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "4DF9E0F8.Netflix" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "64885BlueEdge.OneCalendar" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "7EE7776C.LinkedInforWindows" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "828B5831.HiddenCityMysteryofShadows" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "89006A2E.AutodeskSketchBook" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "9E2F88E3.Twitter" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "A278AB0D.DisneyMagicKingdoms" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "A278AB0D.MarchofEmpires" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "ActiproSoftwareLLC.562882FEEB491" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "AdobeSystemsIncorporated.AdobePhotoshopExpress" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "CAF9E577.Plex" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "D52A8D61.FarmVille2CountryEscape" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "D5EA27B7.Duolingo-LearnLanguagesforFree" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "DB6EA5DB.CyberLinkMediaSuiteEssentials" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "DolbyLaboratories.DolbyAccess" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Drawboard.DrawboardPDF" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Facebook.Facebook" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "flaregamesGmbH.RoyalRevolt2" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "GAMELOFTSA.Asphalt8Airborne" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "KeeperSecurityInc.Keeper" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "king.com.BubbleWitch3Saga" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "king.com.CandyCrushSodaSaga" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "PandoraMediaInc.29680B314EFC2" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "SpotifyAB.SpotifyMusic" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "WinZipComputing.WinZipUniversal" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "XINGAG.XING" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
}

# Uninstall Windows Store
Function UninstallWindowsStore {
	Write-Output "Uninstalling Windows Store..."
	Get-AppxPackage "Microsoft.DesktopAppInstaller" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.WindowsStore" | Remove-AppxPackage
}

# Install Windows Store
Function InstallWindowsStore {
	Write-Output "Installing Windows Store..."
	Get-AppxPackage -AllUsers "Microsoft.DesktopAppInstaller" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.WindowsStore" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
}

# Disable Xbox features
Function DisableXboxFeatures {
	Write-Output "Disabling Xbox features..."
	Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage -ErrorAction SilentlyContinue
	Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage
	Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0
}

# Enable Xbox features
Function EnableXboxFeatures {
	Write-Output "Enabling Xbox features..."
	Get-AppxPackage -AllUsers "Microsoft.XboxApp" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.XboxIdentityProvider" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.XboxSpeechToTextOverlay" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.XboxGameOverlay" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Get-AppxPackage -AllUsers "Microsoft.Xbox.TCUI" | ForEach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
	Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 1
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -ErrorAction SilentlyContinue
}

# Disable built-in Adobe Flash in IE and Edge
Function DisableAdobeFlash {
	Write-Output "Disabling built-in Adobe Flash in IE and Edge..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "DisableFlashInIE" -Type DWord -Value 1
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" -Name "FlashPlayerEnabled" -Type DWord -Value 0
}

# Enable built-in Adobe Flash in IE and Edge
Function EnableAdobeFlash {
	Write-Output "Enabling built-in Adobe Flash in IE and Edge..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Internet Explorer" -Name "DisableFlashInIE" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Addons" -Name "FlashPlayerEnabled" -ErrorAction SilentlyContinue
}

# Uninstall Internet Explorer
Function UninstallInternetExplorer {
	Write-Output "Uninstalling Internet Explorer..."
	Disable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-$env:PROCESSOR_ARCHITECTURE" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Install Internet Explorer
Function InstallInternetExplorer {
	Write-Output "Installing Internet Explorer..."
	Enable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-$env:PROCESSOR_ARCHITECTURE" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Uninstall Work Folders Client - Not applicable to Server
Function UninstallWorkFolders {
	Write-Output "Uninstalling Work Folders Client..."
	Disable-WindowsOptionalFeature -Online -FeatureName "WorkFolders-Client" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Install Work Folders Client - Not applicable to Server
Function InstallWorkFolders {
	Write-Output "Installing Work Folders Client..."
	Enable-WindowsOptionalFeature -Online -FeatureName "WorkFolders-Client" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Install Hyper-V - Not applicable to Home
Function InstallHyperV {
	Write-Output "Installing Hyper-V..."
	If ((Get-WmiObject -Class "Win32_OperatingSystem").Caption -like "*Server*") {
		Install-WindowsFeature -Name "Hyper-V" -IncludeManagementTools -WarningAction SilentlyContinue | Out-Null
	} Else {
		Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -NoRestart -WarningAction SilentlyContinue | Out-Null
	}
}

# Uninstall Hyper-V - Not applicable to Home
Function UninstallHyperV {
	Write-Output "Uninstalling Hyper-V..."
	If ((Get-WmiObject -Class "Win32_OperatingSystem").Caption -like "*Server*") {
		Uninstall-WindowsFeature -Name "Hyper-V" -IncludeManagementTools -WarningAction SilentlyContinue | Out-Null
	} Else {
		Disable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All" -NoRestart -WarningAction SilentlyContinue | Out-Null
	}
}

# Set Photo Viewer association for bmp, gif, jpg, png and tif
Function SetPhotoViewerAssociation {
	Write-Output "Setting Photo Viewer association for bmp, gif, jpg, png and tif..."
	If (!(Test-Path "HKCR:")) {
		New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
	}
	ForEach ($type in @("Paint.Picture", "giffile", "jpegfile", "pngfile")) {
		New-Item -Path $("HKCR:\$type\shell\open") -Force | Out-Null
		New-Item -Path $("HKCR:\$type\shell\open\command") | Out-Null
		Set-ItemProperty -Path $("HKCR:\$type\shell\open") -Name "MuiVerb" -Type ExpandString -Value "@%ProgramFiles%\Windows Photo Viewer\photoviewer.dll,-3043"
		Set-ItemProperty -Path $("HKCR:\$type\shell\open\command") -Name "(Default)" -Type ExpandString -Value "%SystemRoot%\System32\rundll32.exe `"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll`", ImageView_Fullscreen %1"
	}
}

# Unset Photo Viewer association for bmp, gif, jpg, png and tif
Function UnsetPhotoViewerAssociation {
	Write-Output "Unsetting Photo Viewer association for bmp, gif, jpg, png and tif..."
	If (!(Test-Path "HKCR:")) {
		New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
	}
	Remove-Item -Path "HKCR:\Paint.Picture\shell\open" -Recurse -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCR:\giffile\shell\open" -Name "MuiVerb" -ErrorAction SilentlyContinue
	Set-ItemProperty -Path "HKCR:\giffile\shell\open" -Name "CommandId" -Type String -Value "IE.File"
	Set-ItemProperty -Path "HKCR:\giffile\shell\open\command" -Name "(Default)" -Type String -Value "`"$env:SystemDrive\Program Files\Internet Explorer\iexplore.exe`" %1"
	Set-ItemProperty -Path "HKCR:\giffile\shell\open\command" -Name "DelegateExecute" -Type String -Value "{17FE9752-0B5A-4665-84CD-569794602F5C}"
	Remove-Item -Path "HKCR:\jpegfile\shell\open" -Recurse -ErrorAction SilentlyContinue
	Remove-Item -Path "HKCR:\pngfile\shell\open" -Recurse -ErrorAction SilentlyContinue
}

# Add Photo Viewer to "Open with..."
Function AddPhotoViewerOpenWith {
	Write-Output "Adding Photo Viewer to `"Open with...`""
	If (!(Test-Path "HKCR:")) {
		New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
	}
	New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Force | Out-Null
	New-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Force | Out-Null
	Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Name "MuiVerb" -Type String -Value "@photoviewer.dll,-3043"
	Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\command" -Name "(Default)" -Type ExpandString -Value "%SystemRoot%\System32\rundll32.exe `"%ProgramFiles%\Windows Photo Viewer\PhotoViewer.dll`", ImageView_Fullscreen %1"
	Set-ItemProperty -Path "HKCR:\Applications\photoviewer.dll\shell\open\DropTarget" -Name "Clsid" -Type String -Value "{FFE2A43C-56B9-4bf5-9A79-CC6D4285608A}"
}

# Remove Photo Viewer from "Open with..."
Function RemovePhotoViewerOpenWith {
	Write-Output "Removing Photo Viewer from `"Open with...`""
	If (!(Test-Path "HKCR:")) {
		New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
	}
	Remove-Item -Path "HKCR:\Applications\photoviewer.dll\shell\open" -Recurse -ErrorAction SilentlyContinue
}

# Uninstall Microsoft Print to PDF
Function UninstallPDFPrinter {
	Write-Output "Uninstalling Microsoft Print to PDF..."
	Disable-WindowsOptionalFeature -Online -FeatureName "Printing-PrintToPDFServices-Features" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Install Microsoft Print to PDF
Function InstallPDFPrinter {
	Write-Output "Installing Microsoft Print to PDF..."
	Enable-WindowsOptionalFeature -Online -FeatureName "Printing-PrintToPDFServices-Features" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Uninstall Microsoft XPS Document Writer
Function UninstallXPSPrinter {
	Write-Output "Uninstalling Microsoft XPS Document Writer..."
	Disable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Install Microsoft XPS Document Writer
Function InstallXPSPrinter {
	Write-Output "Installing Microsoft XPS Document Writer..."
	Enable-WindowsOptionalFeature -Online -FeatureName "Printing-XPSServices-Features" -NoRestart -WarningAction SilentlyContinue | Out-Null
}

# Remove Default Fax Printer
Function RemoveFaxPrinter {
	Write-Output "Removing Default Fax Printer..."
	Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue
}

# Add Default Fax Printer
Function AddFaxPrinter {
	Write-Output "Adding Default Fax Printer..."
	Add-Printer -Name "Fax" -DriverName "Microsoft Shared Fax Driver" -PortName "SHRFAX:" -ErrorAction SilentlyContinue
}

##########
# Unpinning
##########

# Unpin all Start Menu tiles - Note: This function has no counterpart. You have to pin the tiles back manually.
Function UnpinStartMenuTiles {
	Write-Output "Unpinning all Start Menu tiles..."
	If ([System.Environment]::OSVersion.Version.Build -ge 15063 -And [System.Environment]::OSVersion.Version.Build -le 16299) {
		Get-ChildItem -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Include "*.group" -Recurse | ForEach-Object {
			$data = (Get-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data").Data -Join ","
			$data = $data.Substring(0, $data.IndexOf(",0,202,30") + 9) + ",0,202,80,0,0"
			Set-ItemProperty -Path "$($_.PsPath)\Current" -Name "Data" -Type Binary -Value $data.Split(",")
		}
	} ElseIf ([System.Environment]::OSVersion.Version.Build -eq 17133) {
		$key = Get-ChildItem -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CloudStore\Store\Cache\DefaultAccount" -Recurse | Where-Object { $_ -like "*start.tilegrid`$windows.data.curatedtilecollection.tilecollection\Current" }
		$data = (Get-ItemProperty -Path $key.PSPath -Name "Data").Data[0..25] + ([byte[]](202,50,0,226,44,1,1,0,0))
		Set-ItemProperty -Path $key.PSPath -Name "Data" -Type Binary -Value $data
	}
}

# Unpin all Taskbar icons - Note: This function has no counterpart. You have to pin the icons back manually.
Function UnpinTaskbarIcons {
	Write-Output "Unpinning all Taskbar icons..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites" -Type Binary -Value ([byte[]](255))
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "FavoritesResolve" -ErrorAction SilentlyContinue
}



##########
# Auxiliary Functions
##########

# Relaunch the script with administrator privileges
Function RequireAdmin {
	If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
		Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" $PSCommandArgs" -WorkingDirectory $pwd -Verb RunAs
		Exit
	}
}

# Wait for key press
Function WaitForKey {
	Write-Output "Press any key to continue..."
	[Console]::ReadKey($true) | Out-Null
}

# Restart computer
Function Restart {
	Write-Output "Restarting..."
	Restart-Computer
}

##########
# Debloat Script Additions
##########

Function DebloatAll {

    $Bloatware = @(

        #Unnecessary Windows 10 AppX Apps
	"Microsoft.549981C3F5F10"
	"Microsoft.BingNews"
        "Microsoft.GetHelp"
        "Microsoft.Getstarted"
        "Microsoft.Messaging"
        "Microsoft.Microsoft3DViewer"
	"Microsoft.MixedReality.Portal"	
        "Microsoft.MicrosoftSolitaireCollection"
        "Microsoft.NetworkSpeedTest"
        "Microsoft.News"
        "Microsoft.Office.Lens"
        "Microsoft.Office.Sway"
        "Microsoft.OneConnect"
        "Microsoft.People"
        "Microsoft.Print3D"
        "Microsoft.SkypeApp"
        "Microsoft.StorePurchaseApp"
        "Microsoft.Whiteboard"
        "Microsoft.WindowsAlarms"
        "microsoft.windowscommunicationsapps"
        "Microsoft.WindowsFeedbackHub"
        "Microsoft.WindowsMaps"
        "Microsoft.WindowsSoundRecorder"
	"Microsoft.YourPhone"
        "Microsoft.ZuneMusic"
        "Microsoft.ZuneVideo"

        #Sponsored Windows 10 AppX Apps
        #Add sponsored/featured apps to remove in the "*AppName*" format
        "*EclipseManager*"
        "*ActiproSoftwareLLC*"
        "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"
        "*Duolingo-LearnLanguagesforFree*"
        "*PandoraMediaInc*"
        "*CandyCrush*"
        "*BubbleWitch3Saga*"
        "*Wunderlist*"
        "*Flipboard*"
        "*Twitter*"
        "*Facebook*"
        "*Spotify*"
        "*Royal Revolt*"
        "*Sway*"
        "*Speed Test*"
        "*Dolby*"
             
        #Optional: Typically not removed but you can if you need to for some reason
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe*"
        #"*Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe*"
        #"*Microsoft.BingWeather*"
        #"*Microsoft.MSPaint*"
        #"*Microsoft.MicrosoftStickyNotes*"
        #"*Microsoft.WindowsCalculator*"
        #"*Microsoft.WindowsStore*"
    )
    foreach ($Bloat in $Bloatware) {
        Get-AppxPackage -Name $Bloat| Remove-AppxPackage
        Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Remove-AppxProvisionedPackage -Online
        Write-Output "Removing $Bloat."
    }
}

##########
# Parse parameters and apply tweaks
##########

# Normalize path to preset file
$preset = ""
$PSCommandArgs = $args
If ($args -And $args[0].ToLower() -eq "-preset") {
	$preset = Resolve-Path $($args | Select-Object -Skip 1)
	$PSCommandArgs = "-preset `"$preset`""
}

# Load function names from command line arguments or a preset file
If ($args) {
	$tweaks = $args
	If ($preset) {
		$tweaks = Get-Content $preset -ErrorAction Stop | ForEach { $_.Trim() } | Where { $_ -ne "" -and $_[0] -ne "#" }
	}
}

# Call the desired tweak functions
$tweaks | ForEach { Invoke-Expression $_ }
