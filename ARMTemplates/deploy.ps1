Param(
	[string] $TemplateFile = "ProdAndStage.json",
	[string] $TemplateParameterFile = "param.json",
	[string] $RepoUrl = "https://github.com/azure-appservice-samples/ToDoApp.git",
	[string] $Branch = "master"
)

$start = get-date

if (!(Test-Path ".\$TemplateFile")) 
{
	write-host "template not found" -ForegroundColor Red
}
elseif (!(Test-Path ".\$TemplateParameterFile")) 
{
	write-host "template not found" -ForegroundColor Red
}
else 
{
	if(!(Get-Module Azure) -and !(Get-Module AzureResourceManager))
	{
		Import-Module Azure
	}

	#Use ARM cmdlets
	Switch-AzureMode -Name AzureResourceManager

	#Random
	#Used to randomize the names of the resources being created to avoid conflicts
	$Random = [system.guid]::NewGuid().tostring().substring(0,5)

	#Resource Group Properties
	$RG_Name = "ToDoApp${Random}-group"
	$RG_Location = "West US"

	#Set parameters in parameter file and save to temp.json
	(Get-Content ".\${TemplateParameterFile}" -Raw) `
		-replace "{UNIQUE}",$Random `
		-replace "{LOCATION}",$RG_Location `
		-replace "{REPO}",$RepoUrl `
		-replace "{BRANCH}",$Branch | 
			Set-Content .\temp.json
		
	Write-Host "Creating Resource Group, App Service Plan, Web Apps and SQL Database..." -ForegroundColor Green 
	try 
	{ 
		New-AzureResourceGroup -Verbose `
			-name $RG_Name `
			-location $RG_Location `
			-TemplateFile ".\$TemplateFile" `
			-TemplateParameterFile ".\temp.json" `
			-ErrorAction Stop
			
	}
	catch 
	{
    	Write-Host $Error[0] -ForegroundColor Red 
    	exit 1 
	} 

	Remove-Item .\temp.json | Out-Null

	Write-Host "-----------------------------------------"  -ForegroundColor Green 
	Write-Host $file "execution done"  -ForegroundColor Green 
	[System.Console]::Beep(400,1500)
	
	$end = get-date

	write-host "Start= " $start.Hour ":" $start.Minute ":" $start.Second
	write-host "End= " $end.Hour ":" $end.Minute ":" $end.Second
	pause
}