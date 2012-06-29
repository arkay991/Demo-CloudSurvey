Param([string] $userSettingsFile)

$scriptDir = (split-path $myinvocation.mycommand.path -parent)
Set-Location $scriptDir

# "========= Initialization =========" #

# Get settings from user configuration file
if($userSettingsFile -eq $nul -or $userSettingsFile -eq "")
{
	$userSettingsFile = "..\config.local.xml"
}

[xml]$xmlUserSettings = Get-Content $userSettingsFile

[string] $workingDir = $xmlUserSettings.configuration.localPaths.workingDir
[string] $surveyConnectionString = $xmlUserSettings.configuration.surveyConnectionString

[string] $sourceCodeDir = Resolve-Path "..\Code"

write-host "========= Copying source code to working directory... ========="
if (!(Test-Path "$workingDir"))
{
	New-Item "$workingDir" -type directory | Out-Null
}
Copy-Item "$sourceCodeDir\*" "$workingDir" -Recurse -Force
write-host "Copying source code to working directory done!"

write-host "========= Updating Surveys connection string... ========="
[string] $file = Join-Path $workingDir "CloudSurvey\CloudSurvey\web.release.config"
$x = [xml] (Get-Content $file)
$x.SelectNodes("//connectionStrings/add[@name = 'SurveyConnection']").setAttribute("connectionString", $surveyConnectionString)
$x.Save($file)
write-host "Updating Surveys connection string done!"

write-host "========= Install Node Package ... ========="
$exe = "npm"
& $exe install azure --g
write-host "========= Installing Node Package done! ... ========="