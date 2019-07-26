# Cloudwatch Log Group module

## Description

This module is a simple wrapper around the `aws_cloudwatch_log_group` aws resource. It creates a cloudwatch log group
whose name is namespaced with the terraform workspace and the project name.

## Usage

### Simple un-encrypted log group

```hcl
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myproject"
  vcs_repo = "github.com/account/project"
}

/**
 * Creates a log group whose name will be "prod-myproject-errors" if the terraform workspace is "prod".
 */
module "logs" {
  source  = "PGBI/cloudwatch-log-group/aws"
  version = "~>0.1.0"

  name    = "errors"
  project = module.project
}
```

### Log group with encryption enabled

```hcl
module "project" {
  source  = "PGBI/project/aws"
  version = "~>0.1.0"

  name     = "myproject"
  vcs_repo = "github.com/account/project"
}

/**
 * The KMS key for the logs encryption.
 */
module "kms_key" {
  source  = "PGBI/kms-key/aws"
  version = "~>0.1.0"

  project = module.project

  name        = "error-logs"
  description = "Used by Cloudwatch for the log group \"prod-myproject-errors\"."

  consuming_aws_services = [
    "logs.amazonaws.com"
  ]
}

/**
 * Creates a log group whose name will be "prod-myproject-errors" if the terraform workspace is "prod".
 */
module "logs" {
  source  = "PGBI/cloudwatch-log-group/aws"
  version = "~>0.1.0"

  name        = "errors"
  kms_key_arn = module.kms_key.arn
  project     = module.project
}
```
