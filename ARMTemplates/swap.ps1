Param(
	[string] $Name
)

if(!(Get-Module Azure) -and !(Get-Module AzureResourceManager))
{
	Import-Module Azure
}

#Use ARM cmdlets
Switch-AzureMode -Name AzureServiceManagement

Switch-AzureWebsiteSlot -Name $Name -Slot1 staging -Force
Switch-AzureWebsiteSlot -Name "${Name}Api" -Slot1 staging -Force

Write-Host "Done"