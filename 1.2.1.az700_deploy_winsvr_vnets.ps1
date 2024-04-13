
# Win Svr Vnet Build #

$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

# WinSvrRoute Table Build #

$AzWinSvrRtName = "az700-winsvr-rt001"

$AzWinSvrRt = Get-AzRouteTable -name $AzWinSvrRtName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrRt)
{
    Write-Host "Building $AzWinSvrRtName..."
    $AzWinSvrRt = New-AzRouteTable `
        -Name $AzWinSvrRtName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation
}
else
{
    Write-Host "$AzWinSvrRtName exists..."
}

# WinSvrVnet001 Build #

$AzWinSvrVnetName = "az700-winsvr-vnet001"
$AzWinSvrAddPfx = "172.16.1.0/24"

$AzWinSvrSubnet001Name = "az700-winsvr-subnet001"
$AzWinSvrSubnet001Addpfx  = "172.16.1.0/29"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if ($null -eq $AzWinSvrVnet)
{
    Write-Host "Building $AzWinSvrVnetName..."
    $AzWinSvrVnet = New-AzVirtualNetwork `
        -Name  $AzWinSvrVnetName `
        -ResourceGroupName $AzRgName `
        -Location  $AzLocation `
        -AddressPrefix $AzWinSvrAddPfx
}
else
{
    Write-Host "$AzWinSvrVnetName exists..."
}


$AzWinSvrSubnet001 = Get-AzVirtualNetworkSubnetConfig -Name $AzWinSvrSubnet001Name -VirtualNetwork $AzWinSvrVnet -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrSubnet001)
{
    Write-Host "Building $AzWinSvrSubnet001Name..."
    $AzWinSvrSubnet001 = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzWinSvrSubnet001Name `
        -VirtualNetwork $AzWinSvrVnet `
        -AddressPrefix $AzWinSvrSubnet001Addpfx `
        -RouteTable $AzWinSvrRt
}
else
{
    Write-Host "$AzWinSvrSubnet001Name exists..."
}

# Updating Win Svr Vnet002, adding Subnets #
$AzWinSvrVnet | Set-AzVirtualNetwork

# WinSvrVnet002 Build #

$AzWinSvrVnetName = "az700-winsvr-vnet002"
$AzWinSvrAddPfx = "172.16.2.0/24"

$AzWinSvrSubnet002Name = "az700-winsvr-subnet002"
$AzWinSvrSubnet002Addpfx  = "172.16.2.0/29"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if ($null -eq $AzWinSvrVnet)
{
    Write-Host "Building $AzWinSvrVnetName..."
    $AzWinSvrVnet = New-AzVirtualNetwork `
        -Name  $AzWinSvrVnetName `
        -ResourceGroupName $AzRgName `
        -Location  $AzLocation `
        -AddressPrefix $AzWinSvrAddPfx
}
else
{
    Write-Host "$AzWinSvrVnetName exists..."
}

$AzWinSvrSubnet002 = Get-AzVirtualNetworkSubnetConfig -Name $AzWinSvrSubnet002Name -VirtualNetwork $AzWinSvrVnet -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrSubnet002)
{
    Write-Host "Building $AzWinSvrSubnet002Name..."
    $AzWinSvrSubnet001 = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzWinSvrSubnet002Name `
        -VirtualNetwork $AzWinSvrVnet `
        -AddressPrefix $AzWinSvrSubnet002Addpfx `
        -RouteTable $AzWinSvrRt
}
else
{
    Write-Host "$AzWinSvrSubnet002Name exists..."
}

# Updating Win Svr Vnet002, adding Subnets #
$AzWinSvrVnet | Set-AzVirtualNetwork

# WinSvrVnet003 Build #

$AzWinSvrVnetName = "az700-winsvr-vnet003"
$AzWinSvrAddPfx = "172.16.3.0/24"

$AzWinSvrSubnet003Name = "az700-winsvr-subnet003"
$AzWinSvrSubnet003Addpfx  = "172.16.3.0/29"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if ($null -eq $AzWinSvrVnet)
{
    Write-Host "Building $AzWinSvrVnetName..."
    $AzWinSvrVnet = New-AzVirtualNetwork `
        -Name  $AzWinSvrVnetName `
        -ResourceGroupName $AzRgName `
        -Location  $AzLocation `
        -AddressPrefix $AzWinSvrAddPfx
}
else
{
    Write-Host "$AzWinSvrVnetName exists..."
}

$AzWinSvrSubnet003 = Get-AzVirtualNetworkSubnetConfig -Name $AzWinSvrSubnet003Name -VirtualNetwork $AzWinSvrVnet -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrSubnet003)
{
    Write-Host "Building $AzWinSvrSubnet003Name..."
    $AzWinSvrSubnet003 = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzWinSvrSubnet003Name `
        -VirtualNetwork $AzWinSvrVnet `
        -AddressPrefix $AzWinSvrSubnet003Addpfx `
        -RouteTable $AzWinSvrRt
}
else
{
    Write-Host "$AzWinSvrSubnet003Name exists..."
}

# Updating Win Svr Vnet003, adding Subnets #
$AzWinSvrVnet | Set-AzVirtualNetwork

