
$AzPvtDnsRgName = "az700-pvtdns-rg001"
$AzPvtDnsZoneName = "az700lab.cloud.mynet.co.uk"

$AzPvtDnsZone = Get-AzPrivateDnsZone -Name $AzPvtDnsZoneName -ResourceGroupName $AzPvtDnsRgName -ErrorAction SilentlyContinue
if ($null -eq $AzPvtDnsZone)
{
    Write-Host "Building $AzPvtDAzPvtDnsZoneNamensName..."
    New-AzPrivateDnsZone `
        -Name $AzPvtDnsZoneName `
        -ResourceGroupName $AzpvtDnsRgName `
}
else
{
    Write-Host "$AzPvtDnsZoneName exists..."
}
