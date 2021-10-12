# AWS KMS Terraform Module

Terraform module which creates KMS key and the key alias resources on AWS.

## Usage

``` hcl

data "aws_iam_policy_document" "ssm_key" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${local.account_id}:root"]
    }
  }

  statement {
    sid       = "Allow access for Key Administrators"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:user/${local.admin_username}"
      ]
    }
  }

  statement {
    sid    = "Allow use of the key"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:user/${local.admin_username}"
      ]
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"
    ]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = [
        "arn:aws:iam::${local.account_id}:user/${local.admin_username}"
      ]
    }

    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
  }
}

module "ssm" {
  source = "git@github.com:masterwali/terraform-aws-kms.git"

  description = "KMS key for System Manager"
  alias       = "ssm"
  policy      = data.aws_iam_policy_document.ssm_key.json

  tags = {
    Name  = "ssm"
    Owner = "Waleed"
  }
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.31 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.38 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input_description) | The description of the key as viewed in AWS console. | `string` | `""` | yes |
| <a name="input_key_spec"></a> [key_spec](#input_key_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: SYMMETRIC_DEFAULT, RSA_2048, RSA_3072, RSA_4096, ECC_NIST_P256, ECC_NIST_P384, ECC_NIST_P521, or ECC_SECG_P256K1 | `string` | `SYMMETRIC_DEFAULT` | no |
| <a name="input_enabled"></a> [enabled](#input\enabled) | Specifies whether the key is enabled.  | `bool` | `true` | no |
| <a name="input_rotation_enabled"></a> [rotation_enabled](#input\_rotation_enabled) | Specifies whether key rotation is enabled. | `bool` | `true` | no |
| <a name="input_rotation_tags"></a> [tags](#input\_tags) | A map of tags to assign to the key. | `map` | `""` | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | A valid policy JSON document. This is a key policy, not an IAM policy. | `string` | `""` | yes |
| <a name="input_alias"></a> [alias](#input\_alias) | The display name of the key. | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_id"></a> [key_id](#output\_key_id) | The globally unique identifier for the key. |
| <a name="output_key_arn"></a> [key\_arn](#output\_key_arn) | The Amazon Resource Name (ARN) of the key. |

## Authors

Module is maintained by [Waleed](https://cloudly.engineer).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/master/LICENSE) for full details.
