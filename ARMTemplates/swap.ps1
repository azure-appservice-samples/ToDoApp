Param(
	[string] $Name
)

if(!(Get-Module Azure) -and !(Get-Module AzureResourceManager))
{
	Import-Module Azure
}

#Use ARM cmdlets
Switch-AzureMode -Name AzureServiceManagement -WarningAction SilentlyContinue

#Swap backend first and then frontend
Switch-AzureWebsiteSlot -Name "${Name}Api" -Slot1 staging -Force -Verbose
Switch-AzureWebsiteSlot -Name $Name -Slot1 staging -Force -Verbose

Write-Host "Done"