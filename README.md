## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 3.1.15 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.1.15 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| labels | git::https://github.com/clouddrove/terraform-labels.git?ref=tags/0.14.0 |  |

## Resources

| Name |
|------|
| [aws_workspaces_bundle](https://registry.terraform.io/providers/hashicorp/aws/3.1.15/docs/data-sources/workspaces_bundle) |
| [aws_workspaces_workspace](https://registry.terraform.io/providers/hashicorp/aws/3.1.15/docs/resources/workspaces_workspace) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| application | Application (e.g. `cd` or `clouddrove`). | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`). | `list` | `[]` | no |
| bundle\_id | Guest OS bundle ID | `string` | `"wsb-bh8rsxt14"` | no |
| compute\_type\_name | Computer type name | `string` | `"VALUE"` | no |
| directory\_id | AD ID | `any` | `null` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| label\_order | Label order, e.g. `name`,`application`. | `list` | `[]` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| root\_volume\_encryption\_enabled | Enable root volume encryption | `bool` | `false` | no |
| root\_volume\_size\_gib | Size of the root volume | `number` | `80` | no |
| running\_mode | Workspace runnning mode | `string` | `"AUTO_STOP"` | no |
| running\_mode\_auto\_stop\_timeout\_in\_minutes | Workspace auto stop timeout | `number` | `60` | no |
| user\_volume\_encryption\_enabled | Enable user volume encryption | `bool` | `false` | no |
| user\_volume\_size\_gib | Size of the user volume | `number` | `10` | no |
| volume\_encryption\_key | KMS key for volume encryption | `string` | `"alias/aws/workspaces"` | no |
| workspace\_username | Workspace username | `string` | `"Administrator"` | no |

## Outputs

No output.