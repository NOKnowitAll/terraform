output "resource_group" {
  value = azurerm_resource_group.RG.name
}

output "vnet" {
  value = azurerm_virtual_network.VNET.name
}

output "public_subnet" {
  value = azurerm_subnet.public_subnet.name
}

output "private_subnet" {
  value = azurerm_subnet.private_subnet.name
}


output "storage_account" {
  value = azurerm_storage_account.storage_account.name
}

