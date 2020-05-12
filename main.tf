provider "aws" {
  region  = var.aws_region
  profile = var.aws_cli_profile
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

# alias
resource "aws_iam_account_alias" "this" {
  account_alias = var.aws_account_alias
}

# deactivate endpoints

# password policy

# s3 settings

# ec2 volume encryption

# cloud trail settings

