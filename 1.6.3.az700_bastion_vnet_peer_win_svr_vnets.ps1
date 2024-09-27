$AzBastionRgName = "az700-bastion-rg001"
$AzWinSvrRgName = "az700-winsvr-rg001"

# Bastion Vnet and Win Svr Vnet Peering Build #

$AzBastionVnetName = "az700-bastion-vnet001"
$AzWinSvrVnetNames = "az700-winsvr-vnet001", "az700-winsvr-vnet002", "az700-winsvr-vnet003"

foreach ($AzWinSvrVnetName in $AzWinSvrVnetNames)
{
    $AzBastionVnet = Get-AzVirtualNetwork -Name $AzBastionVnetName -ResourceGroupName $AzBastionRgName
    $AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

    $AzBastionToWinSvrPeeringName = "Peering-to-$AzWinSvrVnetName"
    $AzWinSvrToBastionPeeringName = "Peering-to-$AzBastionVnetName"

    $AzBastionPeerToWinSvr = Get-AzVirtualNetworkPeering -Name $AzBastionToWinSvrPeeringName -VirtualNetworkName $AzBastionVnetName -ResourceGroupName $AzBastionRgName -ErrorAction SilentlyContinue
    if($null -eq $AzBastionPeerToWinSvr)
    {
        Write-Host "For $AzWinSvrVnetName : Building $AzBastionToWinSvrPeeringName..."
        $AzBastionPeerToWinSvr = Add-AzVirtualNetworkPeering `
            -Name $AzBastionToWinSvrPeeringName `
            -VirtualNetwork $AzBastionVnet `
            -RemoteVirtualNetworkId $AzWinSvrVnet.Id `
            -AllowForwardedTraffic `
    }
    else
    {
        Write-Host "FOr $AzWinSvrVnetName : $AzBastionToWinSvrPeeringName exists..."
    }

    $AzWinSvrPeerToBastion = Get-AzVirtualNetworkPeering -Name $AzWinSvrToBastionPeeringName -VirtualNetworkName $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName -ErrorAction SilentlyContinue
    if($null -eq $AzWinSvrPeerToBastion)
    {
        Write-Host "For $AzWinSvrVnetName : Building $AzWinSvrToBastionPeeringName..."
        $AzWinSvrPeerToBastion = Add-AzVirtualNetworkPeering `
            -Name $AzWinSvrToBastionPeeringName `
            -VirtualNetwork $AzWinSvrVnet `
            -RemoteVirtualNetworkId $AzBastionVnet.Id `
            -AllowForwardedTraffic `
    }
    else
    {
        Write-Host "For $AzWinSvrVnetName : $AzWinSvrToBastionPeeringName exists..."
    }
}
