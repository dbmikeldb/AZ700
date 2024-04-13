
# IPSec Policy Build #
$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

$IkeEncryption = "AES256"
$IkeIntegrity = "SHA256"
$DhGroup = "DHGroup2"
$IpSecEncryption = "AES256"
$IPSecIntegriy = "SHA256"
$PfsGroup = "None"
$SaLifeTimeSeconds = "3600"

$AzVngToLngIpSecPolicy = New-AzIpsecPolicy `
    -IkeEncryption $IkeEncryption `
    -IkeIntegrity $IkeIntegrity `
    -DhGroup $DhGroup `
    -IpsecEncryption $IpSecEncryption `
    -IpsecIntegrity $IPSecIntegriy `
    -PfsGroup $PfsGroup `
    -SALifeTimeSeconds $SaLifeTimeSeconds



# VNG to LNG VPN Build #
$AzVngName = "az700-vng001"
$AzLngName = "az700-lng001"

$AzVng = Get-AzVirtualNetworkGateway -Name $AzVngName -ResourceGroupName $AzRgName
$AzLng = Get-AzLocalNetworkGateway -Name $AzLngName -ResourceGroupName $AzRgName

#$AzVngBgpIp = $AzVng.BgpSettingsText
$AzVngToLngConnName = "az700-vng-to-lng-conn001"
$AzVngToLngConnType = "IPSec"
$AzVngToLngConnDpdTimeout = 30
$AzVngToLngPsk = "Charlie0507!"
$AzVngToLngEnableBgp = $True
$AzVngToLngProtocol = "IKEv2"


$AzVngToLngConn = Get-AzVirtualNetworkGatewayConnection -Name $AzVngToLngConnName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if ($null -eq $AzVngToLngConn)
{
    Write-Host "Building $AzVngToLngConnName..."
    $AzVngToLngConn = New-AzVirtualNetworkGatewayConnection `
        -Name $AzVngToLngConnName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation `
        -VirtualNetworkGateway1 $AzVng `
        -LocalNetworkGateway2 $AzLng `
        -ConnectionType $AzVngToLngConnType `
        -DpdTimeoutInSeconds $AzVngToLngConnDpdTimeout `
        -SharedKey $AzVngToLngPsk `
        -Peer $AzLngGatewayIp `
        -EnableBgp $AzVngToLngEnableBgp `
        -IpsecPolicies $AzVngToLngIpSecPolicy `
        -ConnectionProtocol $AzVngToLngProtocol `
        -AsJob
        #-GatewayCustomBgpIpAddress $AzVngBgpIp `
}
else
{
    Write-Host "$AzVngToLngConnName exists..."
}

