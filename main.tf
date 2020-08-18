provider "aws" {
  region  = var.aws_region
  profile = var.aws_cli_profile
}

terraform {
  # The configuration for this backend will be
  # filled in by Terragrunt
  backend "s3" {}
}

# Creates/manages KMS CMK
resource "aws_kms_key" "this" {
  description              = var.description
  customer_master_key_spec = var.key_spec
  is_enabled               = var.enabled
  enable_key_rotation      = var.rotation_enabled
  tags                     = var.tags
  policy                   = var.policy
  deletion_window_in_days  = 30
}

# Add an alias to the key
resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.this.key_id
}
