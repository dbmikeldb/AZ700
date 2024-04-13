$AzRgName = "az700-afw-policy-rg001"
$AzLocation = "ukwest"

$AzFwPolicyName = "az700-afw-policy001"
$AzFwPolicySkuTier = "Basic"

# Azure Firewall Policy Build #

$AzFwPolicy = Get-AzFirewallPolicy -Name $AzFwPolicyName -ResourceGroupName $AzRgName -ErrorAction SilentlyContinue
if ($null -eq $AzFwPolicy)
{
    Write-Host "Building $AzFwPolicyName..."
    $AzFwPolicy = New-AzFirewallPolicy `
        -Name $AzFwPolicyName `
        -ResourceGroupName $AzRgName `
        -Location $AzLocation `
        -SkuTier $AzFwPolicySkuTier `
}
else
{
    Write-Host "$AzFwPolicyName exists..."    
}
