
# Storage Vnet Build #

$AzStorageRgName = "az700-storage-rg001"
$AzLocation = "ukwest"

# Storage Build #

$AzstorageVnetName = "az700-storage-vnet001"
$AzstorageAddPfx = "172.16.254.0/24"

$AzstorageSubnet001Name = "az700-storage-subnet001"
$AzstorageSubnet001Addpfx  = "172.16.254.0/29"

$AzstorageVnet = Get-AzVirtualNetwork -Name $AzstorageVnetName -ResourceGroupName $AzstorageRgName -ErrorAction SilentlyContinue
if ($null -eq $AzstorageVnet)
{
    Write-Host "Building $AzstorageVnetName..."
    $AzstorageVnet = New-AzVirtualNetwork `
        -Name  $AzstorageVnetName `
        -ResourceGroupName $AzstorageRgName `
        -Location  $AzLocation `
        -AddressPrefix $AzstorageAddPfx
}
else
{
    Write-Host "$AzstorageVnetName exists..."
}


$AzstorageSubnet001 = Get-AzVirtualNetworkSubnetConfig -Name $AzstorageSubnet001Name -VirtualNetwork $AzstorageVnet -ErrorAction SilentlyContinue
if($null -eq $AzstorageSubnet001)
{
    Write-Host "Building $AzstorageSubnet001Name..."
    $AzstorageSubnet001 = Add-AzVirtualNetworkSubnetConfig `
        -Name $AzstorageSubnet001Name `
        -VirtualNetwork $AzstorageVnet `
        -AddressPrefix $AzstorageSubnet001Addpfx `
        -RouteTable $AzstorageRt
}
else
{
    Write-Host "$AzstorageSubnet001Name exists..."
}

# Updating Storage Vnet, adding Subnets #
$AzstorageVnet | Set-AzVirtualNetwork
