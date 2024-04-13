
$AzureAplicationId ="25f9fed5-9134-405c-866b-352171a257a3"
$AzureTenantId= "0cbdb06d-3fd2-4a9d-88da-987cfd7d06d1"
$AzurePassword = ConvertTo-SecureString "4DX8Q~O6DdSmgJVWnfUvHip15TDPC0AQJP08yaXV" -AsPlainText -Force

$AzPsCred = New-Object System.Management.Automation.PSCredential($AzureAplicationId , $AzurePassword)

Connect-AzAccount `
    -Credential $AzPsCred `
    -TenantId $AzureTenantId `
    -ServicePrincipal

$AzRgName = "az700-rg001"
$AzLocation = "ukwest"

$AzRg = Get-AzResourceGroup -Name $AzRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzRg)
{
    Write-Host "Building $AzRgName..."
    $AzRg = New-AzResourceGroup `
        -Name $AzRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzRgName exists..."
}

