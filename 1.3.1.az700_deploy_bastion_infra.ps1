$AzBastionRgName = "az700-bastion-rg001"
$AzLocation = "ukwest"

# Bastion Vnet Build #

$AzBastionVnetName = "az700-bastion-vnet001"
$AzBastionAddPfx = "172.16.255.0/24"

$AzBastionSubnet001Name = "AzureBastionSubnet"
$AzBastionSubnet001Addpfx  = "172.16.255.192/26"

$AzBastionVnet = Get-AzVirtualNetwork -Name $AzBastionVnetName -ResourceGroupName $AzBastionRgName -ErrorAction SilentlyContinue
if ($null -eq $AzBastionVnet)
{
    Write-Host "Building $AzBastionVnetName..."
    $AzBastionVnet = New-AzVirtualNetwork `
        -Name  $AzBastionVnetName `
        -ResourceGroupName $AzBastionRgName `
        -Location  $AzLocation `
        -AddressPrefix $AzBastionAddPfx
}
else
{
    Write-Host "$AzBastionVnetName exists..."
}

$AzBastionSubnet001 = Get-AzVirtualNetworkSubnetConfig -Name $AzBastionSubnet001Name -VirtualNetwork $AzBastionVnet -ErrorAction SilentlyContinue
if($null -eq $AzBastionSubnet001)
{
    Write-Host "Building $AzBastionSubnet001Name..."
    $AzBastionSubnet001 = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzBastionSubnet001Name `
        -VirtualNetwork $AzBastionVnet `
        -AddressPrefix $AzBastionSubnet001Addpfx
}
else
{
    Write-Host "$AzBastionSubnet001Name exists..."
}

# Updating bastion Vnet adding Subnets #
$AzBastionVnet | Set-AzVirtualNetwork

# Bastion Pip Build #
$AzBastionPipName = "az700-bastion-pip001"
$AzBastionPipSku = "Standard"

$AzBastionPip = Get-AzPublicIpAddress -Name $AzBastionPipName -ResourceGroupName $AzBastionRgName -ErrorAction SilentlyContinue
if($null -eq $AzBastionPip)
{
    Write-Host "Building $AzBastionPipName..."
    $AzBastionPip = New-AzPublicIpAddress `
        -Name  $AzBastionPipName `
        -ResourceGroupName $AzBastionRgName `
        -Location $AzLocation `
        -Sku $AzBastionPipSku `
        -AllocationMethod Static
}
else
{
   Write-Host "$AzBastionPipName exits..."
}

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
