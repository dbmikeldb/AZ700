
# Vng Vnet Build #
$AzHubRgName = "az700-hub-rg001"
$AzLocation = "ukwest"
$AzHubVnetName = "az700-hub-vnet001"
$AzHubVnetAddPfx = "172.16.0.0/24"

$AzHubVnet = Get-AzVirtualNetwork -Name $AzHubVnetName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzHubVnet)
{
    Write-Host "Building $AzHubVnetName..."
    $AzHubVnet = New-AzVirtualNetwork `
        -Name $AzHubVnetName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -AddressPrefix $AzHubVnetAddPfx
}
else{
   Write-Host "$AzHubVnetName exists..."
}

# Vng Route Table Build #
$AzVngRtName = "az700-vng-rt001"

$AzVngRt = Get-AzRouteTable -Name $AzVngRtName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngRt)
{
    Write-Host "Building $AzVngRtName..."
    $AzVngRouteTable = New-AzRouteTable `
        -Name $AzVngRtName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation
}
else{
   Write-Host "$AzVngRtName exists..."
}

# Vng Subnet Build #
$AzVngSubnetName = "GatewaySubnet"
$AzVngSubnetAddPfx = "172.16.0.0/27"

$AzVngSubnet = Get-AzVirtualNetworkSubnetConfig -Name $AzVngSubnetName -VirtualNetwork $AzHubVnet -ErrorAction SilentlyContinue
if($null -eq $AzVngSubnet)
{
    Write-Host "Building $AzVngSubnetName..."
    $AzVngSubnet = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzVngSubnetName `
        -VirtualNetwork $AzHubVnet `
        -AddressPrefix $AzVngSubnetAddPfx `
        -RouteTable $AzVngRouteTable
}
else{
   Write-Host "$AzVngSubnetName exists..."
}

# Vng Pip Build #
$AzVngPipName = "az700-vng-pip001"
$AzVngPipSku = "Standard"

$AzVngPip = Get-AzPublicIpAddress -Name $AzVngPipName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPip)
{
    Write-Host "Building $AzVngPipName..."
    $AzVngPip = New-AzPublicIpAddress `
        -Name  $AzVngPipName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -Sku $AzVngPipSku `
        -AllocationMethod Static
}
else{
   Write-Host "$AzVngPipName exits..."
}

# Afw Route Table Build #
$AzFwRtName = "az700-afw-rt001"

$AzFwRt = Get-AzRouteTable -Name $AzFwRtName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzFwRt)
{
    Write-Host "Building $AzFwRtName..."
    $AzFwRt = New-AzRouteTable `
        -Name $AzFwRtName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation
}
else{
   Write-Host "$AzFwRtName exists..."
}

# Afw Subnet Build #
$AzFwSubnetName = "AzureFirewallSubnet"
$AzFwSubnetAddPfx = "172.16.0.128/26"

$AzFwSubnet = Get-AzVirtualNetworkSubnetConfig -Name $AzFwSubnetName -VirtualNetwork $AzHubVnet -ErrorAction SilentlyContinue
if($null -eq $AzFwSubnet)
{
    Write-Host "Building $AzFwSubnetName..."
    $AzFwSubnet = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzFwSubnetName `
        -VirtualNetwork $AzHubVnet `
        -AddressPrefix $AzFwSubnetAddPfx `
        -RouteTable $AzFwRt
}
else{
   Write-Host "$AzFwSubnetName exists..."
}

# AzFw Subnet Build #
$AzFwMgmtSubnetName = "AzureFirewallManagementSubnet"
$AzFwMgmtSubnetAddPfx = "172.16.0.192/26"

$AzFwMgmtSubnet = Get-AzVirtualNetworkSubnetConfig -Name $AzFwmgmtSubnetName -VirtualNetwork $AzHubVnet -ErrorAction SilentlyContinue
if($null -eq $AzFwMgmtSubnet)
{
    Write-Host "Building $AzFwMgmtSubnetName..."
    $AzFwMgmtSubnet = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzFwMgmtSubnetName `
        -VirtualNetwork $AzHubVnet `
        -AddressPrefix $AzFwMgmtSubnetAddPfx `
        -RouteTable $AzFwRouteTable
}
else{
   Write-Host "$AzFwMgmtSubnetName exists..."
}

# Azfw Pip Build #
$AzFwPipName = "az700-afw-pip001"
$AzFwPipSku = "Standard"

$AzFwPip = Get-AzPublicIpAddress -Name $AzFwPipName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzFwPip)
{
    Write-Host "Building $AzFwPipName..."
    $AzFwPip = New-AzPublicIpAddress `
        -Name  $AzFwPipName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -Sku $AzFwPipSku `
        -AllocationMethod Static
}
else{
   Write-Host "$AzFwPipName exits..."
}

# Azfw Mgmt Pip Build #
$AzFwMgmtPipName = "az700-afw-mgmt-pip001"
$AzFwMgmtPipSku = "Standard"

$AzFwMgmtPip = Get-AzPublicIpAddress -Name $AzFwMgmtPipName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzFwMgmtPip)
{
    Write-Host "Building $AzFwMgmtPipName..."
    $AzFwMgmtPip = New-AzPublicIpAddress `
        -Name  $AzFwMgmtPipName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -Sku $AzFwMgmtPipSku `
        -AllocationMethod Static
}
else{
   Write-Host "$AzFwMgmtPipName exits..."
}

# Updating Hub Vnet, adding Subnets #
$AzHubVnet | Set-AzVirtualNetwork