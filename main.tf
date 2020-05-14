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

# password policy
resource "aws_iam_account_password_policy" "this" {
  minimum_password_length        = 14
  max_password_age               = 150
  password_reuse_prevention      = 3
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

# s3 settings

# ec2 volume encryption

# cloud trail settings
# deactivate endpoints

