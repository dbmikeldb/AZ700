$AzHubRgName = "az700-hub-rg001"
$AzFwPolicyRgName = "az700-afw-policy-rg001"

$AzLocation = "ukwest"

$AzHubVnetName = "az700-hub-vnet001"
$AzFwPipName = "az700-afw-pip001"
$AzFwMgmtPipName = "az700-afw-mgmt-pip001"

$AzFwPolicyName = "az700-afw-policy001"

$AzFwName = "az700-afw001"
$AzFwSkuName = "AZFW_VNet"
$AzFwSkuTier = "Standard"

$AzHubVnet = Get-AzVirtualNetwork -Name $AzHubVnetName -ResourceGroupName $AzHubRgName 
$AzFwPip = Get-AzPublicIpAddress -Name $AzFwPipName -ResourceGroupName $AzHubRgName
$AzFwMgmtPip = Get-AzPublicIpAddress -Name $AzFwMgmtPipName -ResourceGroupName $AzHubRgName

$AzFwPolicy = Get-AzFirewallPolicy -Name $AzFwPolicyName -ResourceGroupName $AzFwPolicyRgName

$AzFw = Get-AzFirewall -Name $AzFwName -ResourceGroupName -AsRgName -ErrorAction SilentlyContinue
if($null -eq $AzFw)
{
    Write-Host "Building $AzFwName..."
    $AzFw = New-AzFirewall `
        -Name $AzFwName `
        -ResourceGroupName $AzHubRgName `
        -Location $AzLocation `
        -VirtualNetwork $AzHubVnet `
        -PublicIpAddress $AzFwPip `
        -ManagementPublicIpAddress $AzFwMgmtPip `
        -SkuName $AzFwSkuName `
        -SkuTier $AzFwSkuTier `
        -FirewallPolicyId $AzFwPolicy.Id `
}
else
{
    Write-Host "$AzFwName exists..."
}
