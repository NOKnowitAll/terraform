provider "azurerm" {
  features {}
}

# ================== Resource Group (RG) ===========================

resource "azurerm_resource_group" "RG" {
  name     = "${var.base_name}${var.custom_identifier}-rg"
  location = var.azure_region

  tags = {
    Name = "${var.base_name}${var.custom_identifier}-rg"
  }
}

# ================== Virtual Network (VNet) ======================== 

# Create virtual network
resource "azurerm_virtual_network" "VNET" {
  name                = "${var.base_name}${var.custom_identifier}-vnet"
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  address_space       = [var.address_space]
  # depends_on          = [azurerm_storage_account.storage_account]

  tags = {
    Name = "${var.base_name}${var.custom_identifier}-vnet"
  }
}

# Create 1st subnet
resource "azurerm_subnet" "public_subnet" {
  name                 = "${var.subnet2}"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VNET.name
  address_prefixes     = [cidrsubnet(var.address_space, 8, 1)]
  # depends_on           = [azurerm_virtual_network.VNET]
}

# Create 2nd subnet
resource "azurerm_subnet" "private_subnet" {
  name                 = "${var.subnet1}"
  resource_group_name  = azurerm_resource_group.RG.name
  virtual_network_name = azurerm_virtual_network.VNET.name
  address_prefixes     = [cidrsubnet(var.address_space, 8, 10)]
  # depends_on           = [azurerm_subnet.public_subnet]
}


# ================== Storage Account (SA) =============================

# Create storage account for VM boot diagnostics
resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.base_name}${var.custom_identifier}sa"
  location                 = azurerm_resource_group.RG.location
  resource_group_name      = azurerm_resource_group.RG.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # depends_on               = [azurerm_resource_group.RG]
  # allow_nested_items_to_be_public = false

  tags = {
    Name = "${var.base_name}${var.custom_identifier}sa"
  }
}


