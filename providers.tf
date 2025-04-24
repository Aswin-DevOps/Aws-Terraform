terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.95.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-rak"
    key    = "staging/statefile"
    region = "me-central-1"
    # dynamodb_table = "rak-state"
    use_lockfile = true
    encrypt      = true
  }
}

provider "aws" {
  region = var.region
}