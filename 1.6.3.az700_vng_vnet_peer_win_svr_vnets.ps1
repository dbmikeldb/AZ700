$AzHubRgName = "az700-hub-rg001"
$AzWinSvrRgName = "az700-winsvr-rg001"

# Vng Vnet and WinSvr Vnet001 Peering Build #

$AzHubVnetName = "az700-hub-vnet001"
$AzWinSvrVnetName = "az700-winsvr-vnet001"

$AzHubVnet = Get-AzVirtualNetwork -Name $AzHubVnetName -ResourceGroupName $AzHubRgName
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzHubVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzHubVnetName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzHubVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzHubVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzWinSvrToVngPeeringName exists..."
}

# Vng Vnet and WinSvr Vnet002 Peering Build #

$AzWinSvrVnetName = "az700-winsvr-vnet002"
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzHubVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzHubVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzHubVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "or $AzWinSvrVnetName : BBuilding $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzHubVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzWinSvrToVngPeeringName exists..."
}

# Vng Vnet and WinSvr Vnet003 Peering Build #
$AzWinSvrVnetName = "az700-winsvr-vnet003"
$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

$AzVngToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
$AzWinSvrToVngPeeringName = "Peering-to-$AzHubVnetName"

$AzVngPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzVngToWinSvrPeeringName -VirtualNetworkName $AzHubVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
if($null -eq $AzVngPeerToWinSvr)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzVngToWinSvrPeeringName..."
    $AzVngPeerToWinSvr = Add-AzVirtualNetworkPeering `
        -Name $AzVngToWinSvrPeeringName `
        -VirtualNetwork $AzHubVnet `
        -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
        -AllowForwardedTraffic `
        -AllowGatewayTransit
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzVngToWinSvrPeeringName exists..."
}

$AzWinSvrPeerToVng = Get-AzVirtualNetworkPeering -Name $AzWinSvrToVngPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
if($null -eq $AzWinSvrPeerToVng)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzWinSvrToVngPeeringName..."
    $AzWinSvrPeerToVng = Add-AzVirtualNetworkPeering `
        -Name $AzWinSvrToVngPeeringName `
        -VirtualNetwork $AzWinSvrVnet `
        -RemoteVirtualNetworkId $AzHubVnet.Id `
        -AllowForwardedTraffic `
        -UseRemoteGateways
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzWinSvrToVngPeeringName exists..."
}