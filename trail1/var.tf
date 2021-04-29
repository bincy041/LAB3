variable "environment" {
  type=list(string)
  default = []
}

variable "os" {
    type=list(string)
    default = []
}

variable "region" {
  default=[]
}

variable "azs" {
  default =[]
}

locals {
  environment = [for environment in var.environment : substr(environment, 0, 1)]  
  os          = [for os in var.os : substr(os, 0, 1)]                                                   #output will be ["w","l"]
  azs1        = element([for azs in var.azs : element(split("", element(split("-", azs), 0)), 0)], 0)   #output will be "w"
  azs2        = [for azs in var.azs : element(split("-", azs), 1)]                                      #output will be "["1a","1b","1c"]"
  
  setproduct  = setproduct(local.azs2, local.environment, local.os)
  example = [for x in local.setproduct : "${var.region}${local.azs1}${x[0]}${x[1]}${x[2]}"]

}