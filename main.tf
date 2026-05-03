# Configure the Azure provider
terraform {
cloud {
    organization = "myTFOrganizatoin"
    workspaces {
      name = "hcp-terraform-demo"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_hcp" {
  name     = var.resource_group_name
  location = "westus2"

  tags = {
    Environment = "Terraform Getting Started on hcp-terraform"
    Team = "DevOps"
  }
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet_hcp" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg_hcp.name
}
