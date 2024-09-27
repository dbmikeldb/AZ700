$AzBastionRgName = "az700-bastion-rg001"
$AzLocation = "ukwest"

# Bastion Vnet Build #

$AzBastionVnetName = "az700-bastion-vnet001"
$AzBastionVnet = Get-AzVirtualNetwork -Name $AzBastionVnetName -ResourceGroupName $AzBastionRgName

$AzBastionPipName = "az700-bastion-pip001"
$AzBastionPip = Get-AzPublicIpAddress -Name $AzBastionPipName -ResourceGroupName $AzBastionRgName

# Bastion Build #
$AzBastionName = "az700-bastion001"
$AzBastionSku = "Standard"

$AzBastion = Get-AzBastion -Name $AzBastionName -ResourceGroupName $AzBastionRgName -ErrorAction SilentlyContinue
if($null -eq $AzBastion)
{
    Write-Host "Build $AzBastionName..."
    $AzBastion = New-AzBastion `
        -Name $AzBastionName `
        -ResourceGroupName $AzBastionRgName `
        -PublicIpAddress $AzBastionPip `
        -VirtualNetwork $AzBastionVnet `
        -Sku $AzBastionSku `
        -AsJob
}
else
{
    Write-Host "$AzBastionName exists..."
}
