Param(
	[string] $Name,
	[string] $FromSlot="staging"
)

if(!(Get-Module Azure) -and !(Get-Module AzureResourceManager))
{
	Import-Module Azure
}

#Use ARM cmdlets
Switch-AzureMode -Name AzureServiceManagement -WarningAction SilentlyContinue

#Swap backend first and then frontend
Switch-AzureWebsiteSlot -Name "${Name}Api" -Slot1 $FromSlot -Slot2 production -Force -Verbose
Switch-AzureWebsiteSlot -Name $Name -Slot1 $FromSlot -Slot2 production -Force -Verbose

Write-Host "Done"