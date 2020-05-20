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

# S3 Public settings
resource "aws_s3_account_public_access_block" "this" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ec2 volume encryption
resource "aws_ebs_encryption_by_default" "this" {
  enabled = true
}

# deactivate endpoints
