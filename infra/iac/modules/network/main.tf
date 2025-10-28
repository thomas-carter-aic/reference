# Example reusable network module
variable "name" {
  description = "Base name for network resources"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC/network"
  type        = string
  default     = "10.0.0.0/16"
}

output "network_name" {
  value = var.name
}
