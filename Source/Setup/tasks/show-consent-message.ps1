param([switch]$ResetAzure,[switch]$ResetLocal,[switch]$SetupAzure,[switch]$SetupLocal,[switch]$CleanupLocal,[switch]$CleanupAzure)

if ($SetupLocal.IsPresent) {
    Write-Warning "This script will setup your machine by performing the following tasks:"
    Write-Host ""    
    Write-Host "1. Copy the demo solution to a working directory"	
	Write-Host "2. Configure the SQL Azure connection string in the demo solution"
	Write-Host "3. Install Windows Azure SDK for Node.js"
	Write-Host "4. Download and import the publish profile file from your Azure account."
}

if ($ResetLocal.IsPresent) {
    Write-Warning "This script will reset your machine by performing the following tasks:"
    Write-Host ""
    Write-Host " 1. Close all Internet Explorer instances"
    Write-Host " 2. Clear Internet Explorer History" -ForegroundColor Red
    Write-Host " 3. Clear Internet Explorer Cookies" -ForegroundColor Red
    Write-Host " 4. Clear Internet Explorer Form Data" -ForegroundColor Red    
    Write-Host " 5. Clear Internet Explorer AutoComplete Settings" -ForegroundColor Red
	Write-Host " 6. Reset the demo solutions from the working directory"
}

if ($SetupAzure.IsPresent) {
    Write-Warning "This script will setup your Azure subscription by performing the following tasks:"
    Write-Host ""
    #TBC
}

if ($ResetAzure.IsPresent) {
    Write-Warning "This script will reset your Azure subscription by performing the following tasks:"
    Write-Host ""
    #TBC
}

if ($CleanupLocal.IsPresent) {
    Write-Warning "This script will reset your machine by performing the following tasks:"
    Write-Host ""
    Write-Host "1. Remove the working directory for the demo"
}

if ($CleanupAzure.IsPresent) {
    Write-Warning "This script will reset your Azure subscription by performing the following tasks:"
    Write-Host ""
    Write-Host " 1. Delete Websites configured in the Config.Azure.xml file" -ForegroundColor Red
	Write-Host " 2. Drop the Windows Azure Sql database" -ForegroundColor Red
}

Write-Host ""

$title = ""
$message = "Are you sure you want to continue?"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No"
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$confirmation = $host.ui.PromptForChoice($title, $message, $options, 1)

if ($confirmation -eq 0) {
    exit 0
}
else {
    exit 1
}


