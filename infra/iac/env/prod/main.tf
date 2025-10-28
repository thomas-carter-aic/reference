terraform {
  backend "local" {
    path = "../../../state/prod.tfstate"
  }
}

locals {
  environment = "prod"
}

module "network" {
  source      = "../../modules/network"
  name        = "prod-network"
  cidr_block  = "10.30.0.0/16"
}
