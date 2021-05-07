provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name     = ("rg-${local.example[0]}")
  location = "East US"
}
#regex("^[-\\w\\._\\(\\)]+$",substr("rg-${local.org}-${local.prj}-${local.env}-main-${local.suffix}", 90))
#^[-\\w\\._\\(\\)]+$
