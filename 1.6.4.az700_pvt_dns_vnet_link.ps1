
$AzWinSvrRgName = "az700-winsvr-rg001"
$AzPvtDnsRgName = "az700-pvtdns-rg001"

$AzPvtDnsZoneName = "az700lab.cloud.mynet.co.uk"


$AzWinSvrVnetName = "az700-winsvr-vnet001"
$AzPvtDnsLinkToWinSvrVnetName = "Link-to-$AzWinSvrVnetName"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

# Link WinSvr Vnet001 to Private DNS Zone #
$AzPvtDnsVnetLink = Get-AzPrivateDnsVirtualNetworkLink -ZoneName $AzPvtDnsZoneName -Name $AzPvtDnsLinkToWinSvrVnetName -ResourceGroupName $AzPvtDnsRgName -ErrorAction SilentlyContinue
if ($null -eq $AzPvtDnsVnetLink)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzPvtDnsLinkToWinSvrVnetName..."
    $AzPvtDnsVnetLink = New-AzPrivateDnsVirtualNetworkLink `
        -Name $AzPvtDnsLinkToWinSvrVnetName `
        -ResourceGroupName $AzPvtDnsRgName `
        -VirtualNetworkId $AzWinSvrVnet.Id `
        -ZoneName $AzPvtDnsZoneName `
        -EnableRegistration
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzPvtDnsLinkToWinSvrVnetName exists... "
}

# Link WinSvr Vnet002 to Private DNS Zone #
$AzWinSvrVnetName = "az700-winsvr-vnet002"
$AzPvtDnsLinkToWinSvrVnetName = "Link-to-$AzWinSvrVnetName"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

$AzPvtDnsVnetLink = Get-AzPrivateDnsVirtualNetworkLink -ZoneName $AzPvtDnsZoneName -Name $AzPvtDnsLinkToWinSvrVnetName -ResourceGroupName $AzPvtDnsRgName -ErrorAction SilentlyContinue
if ($null -eq $AzPvtDnsVnetLink)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzPvtDnsLinkToWinSvrVnetName..."
    $AzPvtDnsVnetLink = New-AzPrivateDnsVirtualNetworkLink `
        -Name $AzPvtDnsLinkToWinSvrVnetName `
        -ResourceGroupName $AzPvtDnsRgName `
        -VirtualNetworkId $AzWinSvrVnet.Id `
        -ZoneName $AzPvtDnsZoneName `
        -EnableRegistration
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzPvtDnsLinkToWinSvrVnetName exists... "
}


# Link WinSvr Vnet003 to Private DNS Zone #
$AzWinSvrVnetName = "az700-winsvr-vnet003"
$AzPvtDnsLinkToWinSvrVnetName = "Link-to-$AzWinSvrVnetName"

$AzWinSvrVnet = Get-AzVirtualNetwork -Name $AzWinSvrVnetName -ResourceGroupName $AzWinSvrRgName

$AzPvtDnsVnetLink = Get-AzPrivateDnsVirtualNetworkLink -ZoneName $AzPvtDnsZoneName -Name $AzPvtDnsLinkToWinSvrVnetName -ResourceGroupName $AzPvtDnsRgName -ErrorAction SilentlyContinue
if ($null -eq $AzPvtDnsVnetLink)
{
    Write-Host "For $AzWinSvrVnetName : Building $AzPvtDnsLinkToWinSvrVnetName..."
    $AzPvtDnsVnetLink = New-AzPrivateDnsVirtualNetworkLink `
        -Name $AzPvtDnsLinkToWinSvrVnetName `
        -ResourceGroupName $AzPvtDnsRgName `
        -VirtualNetworkId $AzWinSvrVnet.Id `
        -ZoneName $AzPvtDnsZoneName `
        -EnableRegistration
}
else
{
    Write-Host "For $AzWinSvrVnetName : $AzPvtDnsLinkToWinSvrVnetName exists... "
}