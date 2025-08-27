## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`). | `list(any)` | `[]` | no |
| bundle\_id | The ID of the bundle for the WorkSpace. | `string` | `"wsb-bh8rsxt14"` | no |
| directory\_id | The ID of the directory for the WorkSpace. | `string` | `"d-00000000"` | no |
| enabled | Flag to control the WorkSpaces creation. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list(any)` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo. | `string` | `"https://github.com/clouddrove/terraform-aws-workspace"` | no |
| root\_volume\_encryption\_enabled | Indicates whether the data stored on the root volume is encrypted. | `bool` | `false` | no |
| user\_volume\_encryption\_enabled | Indicates whether the data stored on the user volume is encrypted. | `bool` | `false` | no |
| volume\_encryption\_key | The symmetric AWS KMS customer master key (CMK) used to encrypt data stored on your WorkSpace. Amazon WorkSpaces does not support asymmetric CMKs. | `string` | `null` | no |
| workspace\_properties | Workspace properties configuration. | <pre>object({<br>    compute_type_name                         = string<br>    user_volume_size_gib                      = number<br>    root_volume_size_gib                      = number<br>    running_mode                              = string<br>    running_mode_auto_stop_timeout_in_minutes = number<br>  })</pre> | <pre>{<br>  "compute_type_name": "VALUE",<br>  "root_volume_size_gib": 80,<br>  "running_mode": "AUTO_STOP",<br>  "running_mode_auto_stop_timeout_in_minutes": 60,<br>  "user_volume_size_gib": 10<br>}</pre> | no |
| workspace\_username | The user name of the user for the WorkSpace. This user name must exist in the directory for the WorkSpace. | `string` | `"Administrator"` | no |

## Outputs

| Name | Description |
|------|-------------|
| computer\_name | n/a |
| id | outputs of aws workspaces |
| ip\_address | n/a |

