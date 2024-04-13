
# Vng Vnet Build #
$AzRgName = "az700-rg001"
$AzLocation = "ukwest"
$AzHubVnetName = "az700-hub-vnet001"
$AzHubVnetAddPfx = "172.16.0.0/24"

$AzVngVnet = Get-AzVirtualNetwork -Name $AzHubVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngVnet)
{
    Write-Host "Building $AzHubVnetName..."
    $AzVngVnet = New-AzVirtualNetwork `
        -Name $AzHubVnetName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation `
        -AddressPrefix $AzHubVnetAddPfx
}
else{
   Write-Host "$AzHubVnetName exists..."
}

# Vng Route Table Build #
$AzVngRtName = "az700-vng-rt001"

$AzVngRt = Get-AzRouteTable -Name $AzVngRtName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngRt)
{
    Write-Host "Building $AzVngRtName..."
    $AzVngRouteTable = New-AzRouteTable `
        -Name $AzVngRtName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation
}
else{
   Write-Host "$AzVngRtName exists..."
}

# Vng Subnet Build #
$AzVngSubnetName = "GatewaySubnet"
$AzVngSubnetAddPfx = "172.16.0.0/27"

$AzVngSubnet = Get-AzVirtualNetworkSubnetConfig -Name $AzVngSubnetName -VirtualNetwork $AzVngVnet -ErrorAction SilentlyContinue
if($null -eq $AzVngSubnet)
{
    Write-Host "Building $AzVngSubnetName..."
    $AzVngSubnet = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzVngSubnetName `
        -VirtualNetwork $AzVngVnet `
        -AddressPrefix $AzVngSubnetAddPfx `
        -RouteTable $AzVngRouteTable
}
else{
   Write-Host "$AzVngSubnetName exists..."
}

# Vng Pip Build #
$AzVngPipName = "az700-vng-pip001"
$AzVngPipSku = "Standard"

$AzVngPip = Get-AzPublicIpAddress -Name $AzVngPipName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPip)
{
    Write-Host "Building $AzVngPipName..."
    $AzVngPip = New-AzPublicIpAddress `
        -Name  $AzVngPipName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation `
        -Sku $AzVngPipSku `
        -AllocationMethod Static
}
else{
   Write-Host "$AzVngPipName exits..."
}

# Azfw Route Table Build #
$AzFwRtName = "az700-azfw-rt001"

$AzFwRt = Get-AzRouteTable -Name $AzFwRtName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzFwRt)
{
    Write-Host "Building $AzFwRtName..."
    $AzFwRt = New-AzRouteTable `
        -Name $AzFwRtName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation
}
else{
   Write-Host "$AzFwRtName exists..."
}

# AzFw Subnet Build #
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
        -RouteTable $AzFwRouteTable
}
else{
   Write-Host "$AzFwSubnetName exists..."
}

# Azfw Pip Build #
$AzFwPipName = "az700-vng-pip001"
$AzFwPipSku = "Standard"

$AzFwPip = Get-AzPublicIpAddress -Name $AzFwPipName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzFwPip)
{
    Write-Host "Building $AzFwPipName..."
    $AzFwPip = New-AzPublicIpAddress `
        -Name  $AzFwPipName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation `
        -Sku $AzFwPipSku `
        -AllocationMethod Static
}
else{
   Write-Host "$AzFwPipName exits..."
}

# Updating Hub Vnet, adding Subnets #
$AzVngVnet | Set-AzVirtualNetwork