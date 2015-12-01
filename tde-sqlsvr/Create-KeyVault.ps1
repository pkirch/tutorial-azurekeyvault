# Settings
$subscriptionName = "MSFT IT Camp Stage"
$resourceGroupName = "keyvault1-classic"
$keyVaultName = PASSCampTest1

# Overview about Azure subscriptions
Get-AzureRmSubscription

# Set working Azure subscription
Set-AzureRmContext -SubscriptionName $subscriptionName

# Create a new Azure Key Vault
New-AzureRmKeyVault -ResourceGroupName $resourceGroupName -VaultName $keyVaultName -Location "West Europe" -Sku premium

# Create a new key inside the Azure Key Vault (HSM)
$key = Add-AzureKeyVaultKey -VaultName $keyVaultName -Name testkey1 -Destination HSM

# Authorize sysadmin
Set-AzureRmKeyVaultAccessPolicy -VaultName $keyVaultName -ServicePrincipalName clientIDsysadmin -PermissionsToKeys get,list,wrapKey,unwrapKey,create

# Authorize dbengine
Set-AzureRmKeyVaultAccessPolicy -VaultName $keyVaultName -ServicePrincipalName clientIDdbengine -PermissionsToKeys get,list,wrapKey,unwrapKey

Get-AzureRmKeyVault -VaultName $keyVaultName

# Remember client IDs and keys for service accounts:
# sysadmin #
# client ID:
# key:

# dbengine #
# client ID:
# key: