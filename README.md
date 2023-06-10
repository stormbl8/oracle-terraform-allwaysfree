# Oracle Cloud Always Free Ampere A1 & E2.1 Compute instance

Terraform module which creates an Always Free Ampere A1 Compute instance in Oracle Cloud.

This module attempts to limit inputs to valid values for the Always Free instance.

Use of this module does not guarantee usage falls within the Always Free tier. For example,
other instances could be using some of the Always Free allocation.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | >=4.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | >=4.37.0 |

## Modules

There is only app Module which holds instance, network,outputs

## Resources

| Name | Type |
|------|------|
| [oci_core_instance.a1](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_instance) | resource |
| [oci_core_images.os](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_images) | data source |
| [oci_core_vnic_attachments.a1_vnic_attachments](https://registry.terraform.io/providers/oracle/oci/latest/docs/data-sources/core_vnic_attachments) | data source |


| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data passed to cloud-init when the instance is started. Defaults to `null`. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The OCID of the instance that was created |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | The private IP address assigned to the instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address assigned to the instance. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
