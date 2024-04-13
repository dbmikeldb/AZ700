$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

# Bastion Vnet and Win Svr Vnet Peering Build #

$AzBastionVnetName = "az700-bastion-vnet001"
$AzWinSvrVnetNames = "az700-winsvr-vnet001", "az700-winsvr-vnet002", "az700-winsvr-vnet003"

foreach ($AzWinSvrVnetName in $AzWinSvrVnetNames)
{
    $AzBastionVnet = Get-AzVirtualNetwork -Name $AzBastionVnetName -ResourceGroupName $AzRgName
    $AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzRgName

    $AzBastionToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
    $AzWinSvrToBastionPeeringName = "Peering-to-$AzBastionVnetName"

    $AzBastionPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzBastionToWinSvrPeeringName -VirtualNetworkName $AzBastionVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
    if($null -eq $AzBastionPeerToWinSvr)
    {
        Write-Host "Building $AzBastionToWinSvrPeeringName..."
        $AzBastionPeerToWinSvr = Add-AzVirtualNetworkPeering `
            -Name $AzBastionToWinSvrPeeringName `
            -VirtualNetwork $AzBastionVnet `
            -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
            -AllowForwardedTraffic `
    }
    else
    {
        Write-Host "$AzBastionToWinSvrPeeringName exists..."
    }

    $AzWinSvrPeerToBastion = Get-AzVirtualNetworkPeering -Name $AzWinSvrToBastionPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
    if($null -eq $AzWinSvrPeerToBastion)
    {
        Write-Host "Building $AzWinSvrToBastionPeeringName..."
        $AzWinSvrPeerToBastion = Add-AzVirtualNetworkPeering `
            -Name $AzWinSvrToBastionPeeringName `
            -VirtualNetwork $AzWinSvrVnet `
            -RemoteVirtualNetworkId $AzBastionVnet.Id `
            -AllowForwardedTraffic `
    }
    else
    {
        Write-Host "$AzWinSvrToBastionPeeringName exists..."
    }
}
