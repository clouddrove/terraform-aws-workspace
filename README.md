<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS workspace
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    AWS WorkSpaces service requires workspaces_DefaultRole IAM role to operate normally.
     </p>

<p align="center">

<a href="https://github.com/clouddrove/terraform-aws-workspace/releases/latest">
  <img src="https://img.shields.io/github/release/clouddrove/terraform-aws-workspace.svg" alt="Latest Release">
</a>
<a href="https://github.com/clouddrove/terraform-aws-workspace/actions/workflows/tfsec.yml">
  <img src="https://github.com/clouddrove/terraform-aws-workspace/actions/workflows/tfsec.yml/badge.svg" alt="tfsec">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-aws-workspace'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AWS+workspace&url=https://github.com/clouddrove/terraform-aws-workspace'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AWS+workspace&url=https://github.com/clouddrove/terraform-aws-workspace'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure. 

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies: 






## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-aws-workspace/releases).


### Simple Example
Here is an example of how you can use this module in your inventory structure:
```hcl
    module "workspace" {
    source       = "clouddrove/workspace/aws"
    version     = "1.0.1"
    name         = "workspace"
    environment  = "test"
    enabled      =  true

    workspace_username = "Administrator"
    label_order        = ["name", "environment"]
    bundle_id          = "wsb-8pmj7b7pq"
    directory_id       = module.ad.directory_id
    }

```






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




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system. 

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback 
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-aws-workspace/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-aws-workspace)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
