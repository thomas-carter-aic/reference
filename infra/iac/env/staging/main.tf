terraform {
  backend "local" {
    path = "../../../state/staging.tfstate"
  }
}

locals {
  environment = "staging"
}

module "network" {
  source      = "../../modules/network"
  name        = "staging-network"
  cidr_block  = "10.20.0.0/16"
}
