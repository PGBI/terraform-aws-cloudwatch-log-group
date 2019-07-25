locals {
  name_prefix = terraform.workspace == "default" ? var.project.name : "${terraform.workspace}-${var.project.name}"
  name        = var.no_name_prefix ? var.name : "${local.name_prefix}-${var.name}"
}

/**
 * The KMS key for the logs encryption.
 */
module "kms_key" {
  source  = "PGBI/kms-key/aws"
  version = "~>0.1.0"

  project = var.project

  name        = "${var.name}-logs"
  description = "Used by Cloudwatch for the log group \"${local.name}\"."

  consuming_aws_services = [
    "logs.amazonaws.com"
  ]
}

/**
 * The log group.
 */
resource "aws_cloudwatch_log_group" "main" {
  name              = local.name
  retention_in_days = var.retention_in_days
  tags              = var.project.tags
  kms_key_id        = module.kms_key.arn
}
