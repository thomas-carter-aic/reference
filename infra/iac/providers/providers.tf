# Provider declarations
terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  skip_credentials_validation = true
  skip_metadata_api_check     = true
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

provider "azurerm" {
  features {}
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS profile name"
  default     = "default"
}

variable "gcp_project" {
  type        = string
  description = "GCP project name"
  default     = "ai-monorepo"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}
