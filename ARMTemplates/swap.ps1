Param(
	[string] $Name,
	[string] $FromSlot="staging"
)

if(!(Get-Module AzureRM))
{
	Import-Module AzureRM
}

#Swap backend first and then frontend
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -Name "${Name}Api" -SourceSlotName $FromSlot -DestinationSlotName production -Verbose
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -Name $Name -SourceSlotName $FromSlot -DestinationSlotName production -Verbose

Write-Host "Done"