terraform {
  backend "local" {
    path = "../../../state/dev.tfstate"
  }
}

locals {
  environment = "dev"
}

module "network" {
  source      = "../../modules/network"
  name        = "dev-network"
  cidr_block  = "10.10.0.0/16"
}
