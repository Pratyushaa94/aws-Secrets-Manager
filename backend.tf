terraform {
  backend "s3" {
    bucket = "terraform-state-bharath-sm-why56"  # ensure all lowercase & globally unique
    key    = "secrets/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

