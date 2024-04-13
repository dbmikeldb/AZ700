
$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

# Win Svrs Build #
$AzWinSvr001Name = "az700-winsvr001"
$AzWinSvr002Name = "az700-winsvr002"
$AzWinSvr003Name = "az700-winsvr003"

$AzWinSvr001 = Get-AzVM -Name $AzWinSvr001Name -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue

if($null -eq $AzWinSvr001)
{
    Write-Host "Building $AzWinSvr001Name..."
    $AzWinSvr001 = New-AzResourceGroupDeployment `
      -ResourceGroupName $AzRgName `
      -TemplateFile ./arm_templates/winsvr_2k19.json `
      -TemplateParameterFile ./arm_templates/winsvr001_params.json `
      -AsJob
}
else
{
    Write-Host "$AzWinSvr001Name exists..."
}

$AzWinSvr002 = Get-AzVM -Name $AzWinSvr002Name -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue

if($null -eq $AzWinSvr002)
{
    Write-Host "Building $AzWinSvr002Name..."
    $AzWinSvr002 = New-AzResourceGroupDeployment `
      -ResourceGroupName $AzRgName `
      -TemplateFile ./arm_templates/winsvr_2k19.json `
      -TemplateParameterFile ./arm_templates/winsvr002_params.json `
      -AsJob
}
else
{
    Write-Host "$AzWinSvr002Name exists..."
}

$AzWinSvr003 = Get-AzVM -Name $AzWinSvr003Name -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue

if($null -eq $AzWinSvr003)
{
    Write-Host "Building $AzWinSvr003Name..."
    $AzWinSvr001 = New-AzResourceGroupDeployment `
      -ResourceGroupName $AzRgName `
      -TemplateFile ./arm_templates/winsvr_2k19.json `
      -TemplateParameterFile ./arm_templates/winsvr003_params.json `
      -AsJob
}
else
{
    Write-Host "$AzWinSvr003Name exists..."
}