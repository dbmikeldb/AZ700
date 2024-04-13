$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

# Vng Vnet and Win Svr Vnet Peering Build#

$AzVngVnetName = "az700-vng-vnet001"
$AzWinSvrVnetName = "az700-winsvr-vnet001"

$AzVngVnet = Get-AzVirtualNetwork -Name $AzVngVnetName -ResourceGroupName $AzRgName
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzVngVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzVngVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzVngVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "$AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "Building $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzVngVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "$AzWinSvrToVngPeeringName exists..."
}

# Vng Vnet and Win Svr Vnet Peering Build#

$AzVngVnetName = "az700-vng-vnet001"
$AzWinSvrVnetName = "az700-winsvr-vnet002"

$AzVngVnet = Get-AzVirtualNetwork -Name $AzVngVnetName -ResourceGroupName $AzRgName
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzVngVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzVngVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzVngVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "$AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "Building $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzVngVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "$AzWinSvrToVngPeeringName exists..."
}

# Vng Vnet and Win Svr Vnet Peering Build#

$AzVngVnetName = "az700-vng-vnet001"
$AzWinSvrVnetName = "az700-winsvr-vnet003"

$AzVngVnet = Get-AzVirtualNetwork -Name $AzVngVnetName -ResourceGroupName $AzRgName
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzVngVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzVngVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzVngVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "$AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "Building $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzVngVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "$AzWinSvrToVngPeeringName exists..."
}