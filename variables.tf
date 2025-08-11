variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "secret_name" {
  type        = string
  description = "Base name of the secret."
}

variable "secret_description" {
  type        = string
  description = "Description of the secret."
}

variable "secret_value" {
  type        = string
  description = "Secret value to be stored in Secrets Manager."
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "Deployment environment: dev/test/prod."
}
