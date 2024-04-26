## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| bundle\_id | The ID of the bundle for the WorkSpace. | `string` | `"wsb-bh8rsxt14"` | no |
| compute\_type\_name | The compute type. For more information, see Amazon WorkSpaces Bundles. Valid values are VALUE, STANDARD, PERFORMANCE, POWER, GRAPHICS, POWERPRO and GRAPHICSPRO. | `string` | `"VALUE"` | no |
| directory\_id | The ID of the directory for the WorkSpace. | `string` | `""` | no |
| enabled | Flag to control the WorkSpaces creation. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `"https://github.com/clouddrove/terraform-aws-workspace"` | no |
| root\_volume\_encryption\_enabled | Indicates whether the data stored on the root volume is encrypted. | `bool` | `false` | no |
| root\_volume\_size\_gib | The size of the root volume. | `number` | `80` | no |
| running\_mode | The running mode. For more information, see Manage the WorkSpace Running Mode. Valid values are AUTO\_STOP and ALWAYS\_ON. | `string` | `"AUTO_STOP"` | no |
| running\_mode\_auto\_stop\_timeout\_in\_minutes | The time after a user logs off when WorkSpaces are automatically stopped. Configured in 60-minute intervals. | `number` | `60` | no |
| user\_volume\_encryption\_enabled | Indicates whether the data stored on the user volume is encrypted. | `bool` | `false` | no |
| user\_volume\_size\_gib | The size of the root volume. | `number` | `10` | no |
| volume\_encryption\_key | The symmetric AWS KMS customer master key (CMK) used to encrypt data stored on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs. | `string` | `null` | no |
| workspace\_username | The user name of the user for the WorkSpace. This user name must exist in the directory for the WorkSpace. | `string` | `"Administrator"` | no |

## Outputs

| Name | Description |
|------|-------------|
| computer\_name | n/a |
| id | outputs of aws workspaces |
| ip\_address | n/a |

