
$AzureAplicationId ="25f9fed5-9134-405c-866b-352171a257a3"
$AzureTenantId= "0cbdb06d-3fd2-4a9d-88da-987cfd7d06d1"
$AzurePassword = ConvertTo-SecureString "4DX8Q~O6DdSmgJVWnfUvHip15TDPC0AQJP08yaXV" -AsPlainText -Force

$AzPsCred = New-Object System.Management.Automation.PSCredential($AzureAplicationId , $AzurePassword)

Connect-AzAccount `
    -Credential $AzPsCred `
    -TenantId $AzureTenantId `
    -ServicePrincipal


# Hub Resoure Group #

$AzHubRgName = "az700-hub-rg001"
$AzLocation = "ukwest"

$AzHubRg = Get-AzResourceGroup -Name $AzHubRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzHubRg)
{
    Write-Host "Building $AzHubRgName..."
    $AzHubRg = New-AzResourceGroup `
        -Name $AzHubRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzHubRgName exists..."
}

# Windows Servers Resource Group #

$AzWinSvrRgName = "az700-winsvr-rg001"
$AzLocation = "ukwest"

$AzWinSvrRg = Get-AzResourceGroup -Name $AzWinSvrRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzWinSvrRg)
{
    Write-Host "Building $AzWinSvrRgName..."
    $AzWinSvrRg = New-AzResourceGroup `
        -Name $AzWinSvrRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzWinSvrRgName exists..."
}

# Private DNS Resource Group #

$AzPvtDnsRgName = "az700-pvtdns-rg001"
$AzLocation = "ukwest"

$AzPvtDnsRg = Get-AzResourceGroup -Name $AzPvtDnsRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzPvtDnsRg)
{
    Write-Host "Building $AzPvtDnsRgName..."
    $AzPvtDnsRg = New-AzResourceGroup `
        -Name $AzPvtDnsRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzPvtDnsRgName exists..."
}

# Bastion Resource Group #

$AzbastionRgName = "az700-bastion-rg001"
$AzLocation = "ukwest"

$AzBastionRg = Get-AzResourceGroup -Name $AzbastionRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzBastionRg)
{
    Write-Host "Building $AzbastionRgName..."
    $AzBastionRg = New-AzResourceGroup `
        -Name $AzbastionRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzbastionRgName exists..."
}

# Azure Firewall Policy Resource Group #

$AzFwPolicyRgName = "az700-afw-policy-rg001"
$AzLocation = "ukwest"

$AzFwPolicyRg = Get-AzResourceGroup -Name $AzFwPolicyRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzFwPolicyRg)
{
    Write-Host "Building $AzFwPolicyRgName..."
    $AzFwPolicyRg = New-AzResourceGroup `
        -Name $AzFwPolicyRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzFwPolicyRgName exists..."
}

# Storage Resource Group #

$AzStorageRgName = "az700-storage-rg001"
$AzLocation = "ukwest"

$AzStorageRg = Get-AzResourceGroup -Name $AzStorageRgName -Location $AzLocation -ErrorAction SilentlyContinue

if($null -eq $AzStorageRg)
{
    Write-Host "Building $AzStorageRgName..."
    $AzStorageRg = New-AzResourceGroup `
        -Name $AzStorageRgName `
        -Location $AzLocation
}
else{
    Write-Host "$AzStorageRgName exists..."
}
