$Rg = "az700-rg001"

$resources = az resource list --resource-group $Rg | ConvertFrom-Json

foreach ($resource in $resources) {
    az resource delete `
        --resource-group $Rg `
        --ids $resource.id `
        --only-show-errors `
        --no-wait
}