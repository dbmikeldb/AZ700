
$AzLocation = "ukwest"

$AzRgs = Get-AzResourceGroup -Location $AzLocation

$AzRgs

foreach ($Azrg in $AzRgs) {
    foreach ($AzResource in $AzRg) {
        az resource delete `
            --resource-group $AzRg `
            --ids $AzResource.Id `
            --only-show-errors `
    }
}