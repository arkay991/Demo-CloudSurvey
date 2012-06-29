Param([string] $demoSettingsFile, [string] $userSettingsFile)

$scriptDir = (split-path $myinvocation.mycommand.path -parent)
Set-Location $scriptDir

# "========= Initialization =========" #

# Get settings from user configuration file
if($userSettingsFile -eq $nul -or $userSettingsFile -eq "")
{
	$userSettingsFile = "..\Config.Local.xml"
}

[xml]$xmlUserSettings = Get-Content $userSettingsFile
[string] $workingDir = $xmlUserSettings.configuration.localPaths.workingDir

#========= Removing current working directory... =========
& ".\tasks\remove-workingdir.ps1" -demoWorkingDir $workingDir

