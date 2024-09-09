variable "aws_region" {
  type = string
  description = "aws region"
  default = "us-east-1"
}

variable "environment" {
  type = string
  description = "environment name"
  default = "dev"
}

variable "business_divsion" {
  type = string
  description = "business divsion"
  default = "sap"
}