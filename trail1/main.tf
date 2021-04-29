provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name     = regex("^[-\\w\\._\\(\\)]+$",("rg-${local.example[0]}"))
  location = "West US"
}
#regex("^[-\\w\\._\\(\\)]+$",substr("rg-${local.org}-${local.prj}-${local.env}-main-${local.suffix}", 90))
#^[-\\w\\._\\(\\)]+$