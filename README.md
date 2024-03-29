# Cloudwatch Log Group module

This module is a simple wrapper around the `aws_cloudwatch_log_group` aws resource. It creates a cloudwatch log group
whose name is namespaced with the terraform workspace and the project name. The logs of the cloudwatch group are
encrypted using a custom KMS key also created by this module.

Usage:

```hcl
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myProject"
  vcs_repo = "github.com/account/project"
}

/**
 * Creates a log group whose name will be "prod-myProject-errors" if the terraform workspace is "prod".
 */
module "logs" {
  source  = "PGBI/cloudwatch-log-group/aws"
  version = "~>0.1.0"

  name     = "errors"
  project  = module.project
}
```
