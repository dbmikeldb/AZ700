
$AzHubRgName = "az700-hub-rg001"
$AzLocation = "ukwest"

$AzHubVnetName = "az700-hub-vnet001"
$AzVngSubnetName = "GatewaySubnet"
$AzVngPipName = "az700-vng-pip001"

$AzHubVnet = Get-AzVirtualNetwork -Name $AzHubVnetName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
$AzVngSubnet = Get-AzVirtualNetworkSubnetConfig -Name $AzVngSubnetName -VirtualNetwork $AzHubVnet -ErrorAction SilentlyContinue
$AzVngPip = Get-AzPublicIpAddress -Name $AzVngPipName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue

# VPNG IP Config Build #
$AzVngIPCfgName = "az700-vng-ipcfg001"

$AzVngIpCfg = New-AzVirtualNetworkGatewayIpConfig `
   -Name $AzVngIPCfgName `
   -SubnetId $AzVngSubnet.Id `
   -PublicIpAddressId $AzVngPip.Id

# Vng BGP Peering Build#
$AzVngBgpIp = "169.254.21.10"

$AzVngBgpCfg = New-AzIpConfigurationBgpPeeringAddressObject `
   -IpConfigurationId $AzVngIpCfg.Id `
   -CustomAddress $AzVngBgpIp

# Vng Build #
$AzVngName = "az700-vng001"
$AzVngGwType = "Vpn"
$AzVngVpnType = "RouteBased"
$AzVngGwSku = "VpnGw1"
$AzVpnGatewayGeneration = "Generation1"

$AzVngAsn = "65534"
$AzVngEnableBgp = $True

$AzVng = Get-AzVirtualNetworkGateway -Name $AzVngName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzVng)
{
   Write-Host "Bulding $AzVngName as a job..."
   $AzVng = New-AzVirtualNetworkGateway `
      -Name $AzVngName `
      -ResourceGroupName $AzHubRgName `
      -Location $AzLocation `
      -VpnType $AzVngVpnType `
      -GatewayType $AzVngGwType `
      -GatewaySku $AzVngGwSku `
      -VpnGatewayGeneration $AzVpnGatewayGeneration `
      -IpConfigurations $AzVngIpCfg `
      -IpConfigurationBgpPeeringAddresses $AzVngBgpCfg `
      -EnableBgp $AzVngEnableBgp `
      -Asn $AzVngAsn `
      -AsJob
}
else{
   Write-Host "$AzVngName exists..."
}
