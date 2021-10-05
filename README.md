# AWS KMS Terraform Module

Terraform module which creates KMS key and the key alias resources on AWS.

## Usage

``` hcl

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
| <a name="input_key_spec"></a> [key_spec](#input_key_spec) | Assign IPv6 address on subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map\_public\_ip\_on\_launch | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\enabled) | A list of availability zones names or ids in the region | `list(string)` | `[]` | no |
| <a name="input_rotation_enabled"></a> [rotation_enabled](#input\_rotation_enabled) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| <a name="input_rotation_tags"></a> [tags](#input\_tags) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| <a name="input_policy"></a> [policy](#input\_policy) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |
| <a name="input_alias"></a> [alias](#input\_alias) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"0.0.0.0/0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azs"></a> [azs](#output\_azs) | A list of availability zones specified as argument to this module |
| <a name="output_cgw_arns"></a> [cgw\_arns](#output\_cgw\_arns) | List of ARNs of Customer Gateway |
| <a name="output_cgw_ids"></a> [cgw\_ids](#output\_cgw\_ids) | List of IDs of Customer Gateway |

## Authors

Module is maintained by [Waleed](https://cloudly.engineer).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-vpc/tree/master/LICENSE) for full details.
