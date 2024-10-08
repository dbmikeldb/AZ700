
$AzHubRgName = "az700-hub-rg001"
$AzLocation = "ukwest"

# LNG Build #
$AzLngName = "az700-lng001"
$AzLngGatewayIp = "81.149.144.12"
$AzLngAsn = "64512"
$AzLngBgpPeerAdd = "169.254.0.1"

$AzLng = Get-AzLocalNetworkGateway -Name $AzLngName -ResourceGroupName $AzHubRgName -ErrorAction SilentlyContinue
if($null -eq $AzLng)
{
    Write-Host "Building $AzLngName..."
    $AzLng = New-AzLocalNetworkGateway `
        -Name $AzLngName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -GatewayIpAddress $AzLngGatewayIp `
        -Asn $AzLngAsn `
        -BgpPeeringAddress $AzLngBgpPeerAdd
}
else{
    Write-Host "$AzLngName exists..."
}
