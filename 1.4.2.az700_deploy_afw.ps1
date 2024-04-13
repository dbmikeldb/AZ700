$AzRgName = "az700-rg001"
$AzLocation -= "ukwest"

$AzFwVnetName = 

$AzFwName = "az700-afw001"

$AzFwSkuName = ""
$AzFwSku = ""



$AzFw = Get-AzFirewall -Name $AzFwName -ResourceGroupName -AsRgName -ErrorAction SilentlyContinue
if($null -eq $AzFw)
{
    Write-Host "Building $AzFwName..."
    $AzFw = New-AzFirewall `
        -Name  `
        -ResourceGroupName  `
        -Location  `
        -VirtualNetworkName  `


        
        -SkuName $AzFwSkuName `
        -SkuTier $AzFwSku `

        -FirewallPolicyId  `

}
else
{
    Write-Host "$AzFwName exists..."
}