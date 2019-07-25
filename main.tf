locals {
  name_prefix = terraform.workspace == "default" ? var.project.name : "${terraform.workspace}-${var.project.name}"
  name        = var.no_name_prefix ? var.name : "${local.name_prefix}-${var.name}"
}

resource "aws_cloudwatch_log_group" "main" {
  name              = local.name
  retention_in_days = var.retention_in_days
  tags              = var.project.tags
}
